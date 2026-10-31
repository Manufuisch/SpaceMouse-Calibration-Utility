/*
Function mouseClicked:

- is called every time a left mouse click is detected
- if a mouse click while Sequenz1/2/3 is detected it it calls the function "UpdateMouseClickStatus()" and stores the return in the global variable KeyReturn
- if a mouse click while ComPortSequenz is detected it mutes the function that work with KeyReturn and calls the function "SlidedComPortRectangle()" and stores the return in the global variable ComPortReturn

*/
void mouseClicked(){
 if (mouseButton == LEFT){

 if(!MouseClickUnlock){
   
 MouseClickUnlock = true;
 
 if(currentSequenze.equals(Sequenzes.Sequenz1)||currentSequenze.equals(Sequenzes.Sequenz2)||currentSequenze.equals(Sequenzes.Sequenz3))KeyReturn = Updates.UpdateMouseClickedStatus();
 
 if(currentSequenze.equals(Sequenzes.ComPortSequenz)){
   
 KeyReturn = MouseClickDetected.ND; ComPortReturn = Updates.SlidedComPortRectangle();
 }

 }else{
 MouseClickUnlock = false;
 if(currentSequenze.equals(Sequenzes.Sequenz1)||currentSequenze.equals(Sequenzes.Sequenz2)||currentSequenze.equals(Sequenzes.Sequenz3))KeyReturn = Updates.UpdateMouseClickedStatus();
 
 if(currentSequenze.equals(Sequenzes.ComPortSequenz)){
 ComPortReturn = Updates.SlidedComPortRectangle();
 }
 }
 }
 }

/*
Helper Function WaitforKeyPressed:

- bridges the function "mouseClicked"
- if a mouse click on the Letter after "Joystick:" was detected the function bridges the function "mouseClicked" and and stores in the global variable KeyReturn the current detected value which is "ND"

*/

void WaitforKeyPressed(){
 if (Updates.WaitingforPressedKey == true){
 KeyReturn = Updates.UpdateMouseClickedStatus();
  }
 }

/*
Class SearchMouseClick:

Responsible for:

- check if/ where the detected mouse click happened in one of the function areas
- checking if/ which relevant key was pressed
- check if/ where the mouse has slid over a ComPort name

*/
 class SearchMouseClick{
 
 public boolean WaitingforPressedKey = false;  
   
 public MouseClickDetected CeyReturn = MouseClickDetected.ND;
 
 /*
 Function UpdateMouseClickedStatus:
 
 - checks if the mouse is in an relevant function area when pressed
 - if == true returns the function that has been pressed on
 */
 public MouseClickDetected UpdateMouseClickedStatus(){// updated every draw()
 
  // JoystickLetter
 //rect(5, 140, 299, 103);
 if (mouseX>=5&&mouseX<=304&&mouseY>=140&&mouseY<=243 || WaitingforPressedKey == true ){ WaitingforPressedKey = true;return ReadWrittenJoystickLetter();}
 
  //Skip
 //rect(737, 4, 264, 70);
 if (mouseX>=737&&mouseX<=1001&&mouseY>=4&&mouseY<=74)return MouseClickDetected.Skip;
 
  //Return
 //rect(737, 79, 264, 57);
 if (mouseX>=737&&mouseX<=1001&&mouseY>=79&&mouseY<=136)return MouseClickDetected.Reset;
 
  //C
 //rect(142.14, 410.87, 24.72, 24.72);
 if (mouseX>=142.14&&mouseX<=166.86&&mouseY>=410.87&&mouseY<=435.59)return MouseClickDetected.C;
 
  //D
 //rect(179.22,  446.94,24.72, 24.72);
 if (mouseX>=179.22&&mouseX<=203.94&&mouseY>=446.94&&mouseY<=471.66)return MouseClickDetected.D;
 
  //B
 //rect(105.06, 446.94,24.72, 24.72);
 if (mouseX>=105.06&&mouseX<=129.78&&mouseY>=446.94&&mouseY<=471.66)return MouseClickDetected.B;

  //A
 //rect(142.14, 481.94,24.72, 24.72);
 if (mouseX>=142.14&&mouseX<=166.86&&mouseY>= 481.94&&mouseY<=506.66)return MouseClickDetected.A;
 
 return MouseClickDetected.ND;
 } 
 
 /*
 Function ReadWrittenJoystickLetter:
 
 - checks of the pressed key is relevant in the programm
 - if true returns the pressed key
 */
 public MouseClickDetected ReadWrittenJoystickLetter() {

   if(keyPressed == true){  
   switch(key){   
    case 'A':
    
    WaitingforPressedKey = false;
    return MouseClickDetected.A;
    
    
    case 'B':
    
    WaitingforPressedKey = false;
    return MouseClickDetected.B;
     
    
    case 'C':
    
    WaitingforPressedKey = false;
    return MouseClickDetected.C;
    
    
    case 'D':
    
    WaitingforPressedKey = false;
    return MouseClickDetected.D;
    
    };}
    return MouseClickDetected.UnknownLetter;
 }

/*
Function SlidedComPortRectangle:

- determines from the given buffer the coordinates of the ComPort names and checks if the mouse has been moved over any of these areas
- if == true returns the ComPort where the mouse has been moved over
*/
public int SlidedComPortRectangle() {
  
  int counter = -1;

  int XCoordinateMassage = -4; // + 5 = 1; 1 + 5 = 6; ...
  int YCoordinateMassage = -3;
  int HeightCoordinateMassage = -2;
  int WidthCoordinateMassage = -1;
  
  for(int i =0; i < draw_String.CoordinatesBuffer.length / 5 ; i++){

    XCoordinateMassage = XCoordinateMassage +5;
    YCoordinateMassage =  YCoordinateMassage +5;
    HeightCoordinateMassage =  HeightCoordinateMassage +5;
    WidthCoordinateMassage =  WidthCoordinateMassage +5;
    
    counter++;

    float ComPortXStart = draw_String.CoordinatesBuffer[XCoordinateMassage];

    float ComPortYStart = draw_String.CoordinatesBuffer[YCoordinateMassage]; 

    float ComPortHeight = draw_String.CoordinatesBuffer[HeightCoordinateMassage]; 

    float ComPortWidth = draw_String.CoordinatesBuffer[WidthCoordinateMassage];;
    
    if (mouseX>=ComPortXStart&&mouseX<=ComPortXStart+ComPortWidth&&mouseY>=ComPortYStart&&mouseY<=ComPortHeight+ComPortYStart)return counter;
}
return -1;}
}
