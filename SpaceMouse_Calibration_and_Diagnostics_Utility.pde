 /*
 ------------------------------------------------------------
 SpaceMouse Calibration and Diagnostic Utility
 ------------------------------------------------------------

 Description:
 This Processing application provides a graphical
 interface for calibration, testing, and diagnostics
 of a custom SpaceMouse using multiple Hall-effect
 joysticks.

 The application communicates with the SpaceMouse
 controller via a serial interface, processes incoming
 raw sensor data, and guides the user through defined
 calibration and verification sequences.

 The Processing implementation is designed to operate
 with the existing Arduino firmware and library code
 without requiring any modification or restructuring
 of the original source code. It therefore acts as a
 direct companion utility that can be integrated into
 the existing project architecture without altering
 the original Arduino implementation.

 Features:
 - Automatic detection and selection of available COM ports
 - Serial communication with the SpaceMouse controller
 - Acquisition of X/Y raw values from multiple Hall joysticks
 - Real-time visualization of joystick measurement data
 - Evaluation of joystick center positions
 - Detection and storage of minimum and maximum axis values
 - Color-coded evaluation of calibration tolerances
 - Sequence-based calibration and diagnostic workflow
 - State-machine-based program and menu control
 - Mouse and keyboard interaction
 - Generation and verification of configuration parameters

 Purpose:
 The utility is intended to simplify initial setup,
 mechanical centering, sensor calibration, functional
 testing, and configuration of the SpaceMouse hardware.

 Author: Emanuel Fischer
 Version: 1.0

 ------------------------------------------------------------
 ------------------------------------------------------------
 */

 import processing.serial.*;

 // Initialising Classes
 StateMachineStaticText draw_StaticSequenzes;
 
 UpdateSequenzes        draw_VariableSequenzValues;
 
 SearchMouseClick       Updates;
 
 Sequenzes              currentSequenze;
 
 JoystickLetter         drawLetters;
 
 drawText               draw_Text;
 
 ComPortScreen          draw_ComPortScreen;
 
 ComPortScreen_Variable draw_String;
 
 Communicate            SerialPortConnection;
 
 MouseClickDetected     DetectedItems;
 
 MouseClickDetected     currentJoystickLetter;
 
 // Enumerations
 
 enum Icons_Available {
 Spacemouse,
 Joystick,
 ResetArrow,
 Arrow,
 CheckArrow
 }  

 enum MouseClickDetected {
 Reset,
 Skip,
 C,
 D,
 B,
 A,
 JoystickLetter,
 UnknownLetter,
 ComPortSequenz,
 ND
 }

 enum Sequenzes {
 Sequenz1,
 Sequenz2,
 Sequenz3,
 ComPortSequenz
 }  

 // Color palette valid for all classes
 final color BLUE   = #3399FF;
 final color ORANGE = #FF6500;
 final color YELLOW = #FFE600;
 final color GREEN  = #35FF4A;
 final color RED    = #FF2323;  
 final color BLACK  = #000000;

 int ComPortReturn = -1;
 
 int ChoosenComPort = -1;
 
 boolean MouseClickUnlock =false;
 
 MouseClickDetected KeyReturn = MouseClickDetected.ND;

 // Timer for Heart Beat Frequenze of the Caret
 int Timer = 500;
 
 String JoystickLetter = "A";

 int DrawComPort;
 
 boolean serialConnected = false;
 
 Serial myPort;

 boolean InitialisationCorrect = false;

 int[] CurrentData = {0,0};

 color[] Colors = {0,0};
 
 int RESET = 2;
 
 int ND = -1; // ND = Not Defined


void setup(){
  
   size(1006, 754);
   
   currentSequenze            = Sequenzes.ComPortSequenz;
   
   currentJoystickLetter      = MouseClickDetected.A;
   
   draw_VariableSequenzValues = new UpdateSequenzes();
   
   Updates                    = new SearchMouseClick();
   
   drawLetters                = new JoystickLetter(Timer,"A");
   
   drawLetters.drawJoystickLetters(MouseClickDetected.ComPortSequenz,#35FF4A);
   
   draw_StaticSequenzes       = new StateMachineStaticText (currentSequenze,false);
   
   draw_Text                  = new drawText();
   
   draw_ComPortScreen         = new ComPortScreen();
   
   draw_String                = new ComPortScreen_Variable(Serial.list());
   }
            
void draw(){

String[] ComPortList =  Serial.list();  

WaitforKeyPressed();
DetectedItems = KeyReturn;

// Serial Initialisation while ComPortSequenz
if(currentSequenze.equals(Sequenzes.ComPortSequenz)){
  
int PressedComPort =  Updates.SlidedComPortRectangle();

if(PressedComPort != ND){DrawComPort = PressedComPort;}else{DrawComPort = ND;}

// Color of the ComPort on which the mouse gets slided on 
draw_String.draw_ComPorts(ComPortList,GREEN,DrawComPort);

if(ComPortReturn != ND){
  
  DetectedItems = MouseClickDetected.Skip;
  
  myPort = new Serial(this,ComPortList[ComPortReturn], 115200);
  
  SerialPortConnection = new Communicate(Sequenzes.Sequenz1);
  
  InitialisationCorrect = true;
  }
}

// State Machine for realisation of the Functions SKIP/ RESET/ JOYSTICK
switch(DetectedItems){
  case Skip:
  
  currentSequenze = Skip(currentSequenze);
  
  currentJoystickLetter = MouseClickDetected.A;
  
  draw_StaticSequenzes.draw_Sequenz(currentSequenze);
  
  drawLetters.drawJoystickLetters(MouseClickDetected.A,#35FF4A);
  break;
  
  case Reset:
  currentSequenze = Sequenzes.Sequenz1;
  currentJoystickLetter = MouseClickDetected.A;
  draw_StaticSequenzes.draw_Sequenz(currentSequenze);
  drawLetters.drawJoystickLetters(MouseClickDetected.A,#35FF4A);
  GETValues(RESET, "A", CurrentData);

  break;
  
  case A :
  case B :
  case C :
  case D :
  case UnknownLetter :
  currentJoystickLetter = DetectedItems;
  drawLetters.drawJoystickLetters(DetectedItems,#35FF4A);
  break;
  
  case ComPortSequenz:
  case JoystickLetter:
  case ND:
  // Placeholder
  break;
};

// Reset the Variable for the next valid DetectedItem
KeyReturn = MouseClickDetected.ND;

// Convert the in the Class defined Letters into Strings
switch(currentJoystickLetter){
  case A:
  JoystickLetter = "A";
  break;
  
  case B:
   JoystickLetter = "B";
  break;
  
  case C:
   JoystickLetter = "C";
  break;
   
  case D:
  JoystickLetter = "D";
  break;
  
  case Reset:
  case UnknownLetter:
  case Skip:
  case ComPortSequenz:
  case JoystickLetter:
  case ND:
  // Placeholder
  break;
};

// Only after ComPort Initialisation massages can get read or sended
if(InitialisationCorrect == true){
SerialPortConnection.SendMassage(currentSequenze); // Updates the sended massages
CurrentData = SerialPortConnection.ReceivedMassage(JoystickLetter); // Updates the read data
}

// StateMachine for updating data of the current variable Sequenze
switch(currentSequenze){
  
case Sequenz1:

  draw_VariableSequenzValues.updateSequenz(currentSequenze,       CurrentData,        JoystickLetter);
break;

case Sequenz2:
 
 Colors = ColorUpdate(CurrentData);
 
 draw_VariableSequenzValues.updateSequenz(currentSequenze,       CurrentData,     JoystickLetter ,Colors[0] ,Colors[1]); 
break;

case Sequenz3:

 int HIGHEST = 1;
 int LOWEST  = 0;

 int[] HIGHESTValuesArray=GETValues(HIGHEST,JoystickLetter,CurrentData);
 int[] LOWESTValuesArray=GETValues(LOWEST,JoystickLetter,CurrentData);

 draw_VariableSequenzValues.updateSequenz(currentSequenze, LOWESTValuesArray, HIGHESTValuesArray, JoystickLetter);
break;

case ComPortSequenz:
// PLaceholder
break;

};
}

// Sequenze Skipper StateMachine
// there's a fixed order in the StateMachine in which the sequenzes are skipped
 Sequenzes Skip(Sequenzes AktuelleSequenzes){
  switch(AktuelleSequenzes){
    
    case ComPortSequenz:
    return Sequenzes.Sequenz1;
    
    case Sequenz1:
    return Sequenzes.Sequenz2;
    
    case Sequenz2:
    return Sequenzes.Sequenz3;
    
    case Sequenz3:
    return Sequenzes.Sequenz1;
    };
    return Sequenzes.Sequenz1; //ERROR = HardReset
}


color ColorBuffer[] = {0,0};
int   oldValues[]   = {0,0};

/*
Function Rectangle Sequenz2:
Decides which colour the Rectangles in Sequenz2 should have based on the input values.
Checks if the given values are between the two specified values.
 */
color[] ColorUpdate(int[] XYValues){

if(XYValues[1] != oldValues[1] || XYValues[0] != oldValues[0]){
  
for(int i =0; i < XYValues.length; i++){
  
  // +/- 20
  ColorBuffer[i] = RED;
  // +/- 10
  if(XYValues[i] >= 502 && XYValues[i] <= 522){ColorBuffer[i] = ORANGE;}
  // +/- 5
  if(XYValues[i] >= 507 && XYValues[i] <= 517){ColorBuffer[i] = YELLOW;}
  // == 512
  if(XYValues[i] == 512){ColorBuffer[i] = GREEN;}
  
}

oldValues[1] =XYValues[1];
oldValues[0] =XYValues[0];
}

return ColorBuffer;
}

/* 
Function Sequenz3:
Determines the max and min values of the respective joysticks based on the input
When the Codes starts the first time and all values are zero, the first measured input gets myPort.written no metter how high the output is.
*/

int[] HIGHESTValues = {0,0,0,0,0,0,0,0};
int[] LOWESTValues = {0,0,0,0,0,0,0,0};

/*
TriState:
0 = LOWEST
1 = HIGHEST
2 = RESET
*/

int[] GETValues(int HighorLow, String JoystickLetter, int[]CurrentValues){

  // RESET FUNCTION
  if(HighorLow == 2){
   for( int i =0; i < 8; i++){
      HIGHESTValues[i] =0;
      LOWESTValues[i] = 0;
      JoystickLetter = "A";
      CurrentValues[1] =0;
      CurrentValues[0] =0;
   }
    return null;
  }
  
  int Counter = 0;
  
  for(int i = 0; i < 2; i++){  
  
  switch(JoystickLetter){
  case "A":
  Counter = 0;
  break;
  
  case "B":
  Counter = 1;
  break;
  
  case "C":
  Counter = 2;
  break;
  
  case "D":
  Counter = 3;
  break;
  };


 if(CurrentValues[0] != 0 && CurrentValues[1] != 0){
  
  if(HIGHESTValues[Counter*2]   < CurrentValues[0] || HIGHESTValues[Counter*2] == 0)   HIGHESTValues[Counter*2] =CurrentValues[0];
  if(HIGHESTValues[Counter*2+1] < CurrentValues[1] || HIGHESTValues[Counter*2+1] == 0) HIGHESTValues[Counter*2+1] =CurrentValues[1];

  
  if (LOWESTValues[Counter*2]   > CurrentValues[0] || LOWESTValues[Counter*2] == 0 )   LOWESTValues[Counter*2] =CurrentValues[0];
  if (LOWESTValues[Counter*2+1] > CurrentValues[1] || LOWESTValues[Counter*2+1] == 0 ) LOWESTValues[Counter*2+1] =CurrentValues[1];
  
  }
}
  if(HighorLow ==1){return HIGHESTValues;}else{return LOWESTValues;}
}
