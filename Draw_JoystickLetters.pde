/*
Class JoystickLetter:

Responsible for:

- drawing the letter A, B, C, D in the circle of the space mouse in variable colours
- drawing the variable letter after "Joystick:" 
- animation of the Carot in the specified hear beat frequenz when the programm is waiting for a specified letter

*/

class JoystickLetter{   
   
private long previousMillis = 0;

private int interval =0;

/*

Konstructorfunction JoystickLetter:

- Heart Beat Frequenze of the Caret gets transfered to the local variable
- initializes the first letter that should be shown when protocoll starts

*/

JoystickLetter(int Timer, String StartLetter){  
  
DrawLetter(StartLetter);

interval = Timer;
}

private drawText draw_Text = new drawText();
/*
Function drawJoystickLetter:

- draws the Letters in the circle of the SpaceMouse in the specified colours

*/
public void drawJoystickLetters(MouseClickDetected ClickedItem, color ColourforLetter){
   
   Background(#000000);
   
   int[] Color={RED,RED,RED,RED};
   
   String CurrentLetter = "A";
   
   switch(ClickedItem){
     case A:
     
     Color[0] = ColourforLetter;
     
     CurrentLetter = "A";
     break;
     
     case B:
     
     Color[3] = ColourforLetter;
     
     CurrentLetter = "B";
     break;
     
     case C:
     
     Color[2] = ColourforLetter;
     
     CurrentLetter = "C";
     break;
     
     case D:
     
     Color[1] = ColourforLetter;
     
     CurrentLetter = "D";
     break;
     
     case UnknownLetter:
     
     CurrentLetter = "ND";
     break;
     
     case ComPortSequenz:
     case JoystickLetter:
     case ND:
     case Reset:
     case Skip:
     //Placeholder
     break;
   };
   
   DrawLetter(CurrentLetter);

/*
      C
      |
 B --- --- D
      |
      A
*/
draw_Text.draw_Text("C", 154.5,  423.235, 24.72, Color[2], CENTER, CENTER);

draw_Text.draw_Text("A", 154.5,  494.305, 24.72,Color[0], CENTER, CENTER);

draw_Text.draw_Text("B", 117.42,  459.285, 24.72, Color[3], CENTER, CENTER);

draw_Text.draw_Text("D", 191.58,  459.285, 24.72, Color[1], CENTER, CENTER);

}
 
private boolean DrawCaret = false;

private String LastLetter = "A";
/*
Function DrawLetter:

- draws the specified Letter A, B, C or D after the word "Joystick:" 
- if Letter == "ND" it draws an Caret in the specified heart beat frequenze

*/
private void DrawLetter(String Letter){
  
  if(Letter != "ND"){
  
  BackgroundLetter (BLACK);
  
  draw_Text.draw_Text(
    Letter,
    200,
    193,
    50,
    RED,
    LEFT,
    CENTER
  );
  
  LastLetter = Letter;
  
  }else{
 
  long currentMillis = millis();

  // timer for heart beat
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
    
  if(!DrawCaret && LastLetter.equals("ND") ){
  DrawCaret = true;
  
  }else{
  DrawCaret = false;
  
  }
  }
  
  
    if (DrawCaret == true){
    
    BackgroundLetter(BLACK);  
    
    draw_Text.draw_Text(
    "|",
    200,
    190,
    50,
    RED,
    LEFT,
    CENTER);
    }
    else{     
  
    BackgroundLetter(BLACK);
    
    }
    LastLetter = Letter;
}
}
 
 /*
 Function BackgroundLetter:
 
 - draws a black square over the previous variable letter after "Joystick:" , before each new drawing of the variable numbers

 */
private void BackgroundLetter (color BackgroundColor){
    
    pushStyle();
    
    noStroke();
    
    fill(BackgroundColor);
  
    float XBackground =198;
    float YBackground  = 171;
    float LENGTHBackground =40;
    float HIGHTBackground = 60;
  
    rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
    popStyle();
}
 
 /*
 Function BackgroundLetter:
 
 - draws a black circle over the previous variable letters in the SpaceMouse circle , before each new drawing of the variable numbers

 */
private void Background (color BackgroundColor){
   pushStyle(); 
   
   noStroke();
   
   float XBackground =154.5;
   float YBackground  = 458.255;
   float LENGTHBackground =104;
   float HIGHTBackground = 104;

  fill(BackgroundColor);

  ellipse(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground
  );
   
  popStyle(); 
}

}   
