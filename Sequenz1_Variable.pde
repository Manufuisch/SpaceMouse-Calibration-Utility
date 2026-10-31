/*
Class Sequenz1_Variable:

Responsible for:

- drawing the variable values in the screen of Sequenz1

*/
class Sequenz1_Variable{
 
 private int X =0;
 private int Y =0;
 /*
 Function draw_VaribaleNumbers:
 
 - filters the needed data from the given array and passes the data to the following function
 */
 public void draw_VariableNumbers(int[] getValues, String Selected_Joystick){
  
    if(getValues.length == 2){
   
    if(getValues[0] != 0) X  = getValues[0];
    if(getValues[1] != 0) Y  = getValues[1];
    
    drawVariableValues(Selected_Joystick,X,Y);
    }
 }
 
private final drawText draw_Text = new drawText();

/*
Function drawVariableValues:

- formates the int values as string
- uses the given data to write it in the places where the variable values have to be wirtten

Variable Values in Sequenz1:
- letter before "X"
- letter before "Y"
- XValues after "X:"
- YValues after "Y:"

*/

private void drawVariableValues(String joystickLetter, int xValue, int yValue) {
 
  Background(BLACK);

  draw_Text.draw_Text(
    joystickLetter + "X:",
    620,
    176,
    36,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    joystickLetter + "Y:",
    620,
    253,
    36,
    RED,
    LEFT,
    CENTER
  );

  // AX
  draw_Text.draw_Text(
    str(xValue),
    708,
    176,
    36,
    RED,
    LEFT,
    CENTER
  );

  // AY
  draw_Text.draw_Text(
    str(yValue),
    708,
    253,
    36,
    RED,
    LEFT,
    CENTER
  );
}
  /*
 Function Background:
 
 - draws black squares over the previous variable value columns, before each new drawing of the variable numbers

 */
  private void Background (color BackgroundColor){

  fill(BackgroundColor);
   
  pushStyle();
  
  noStroke();
  
  float XBackground =610;
  float YBackground  = 145;
  float LENGTHBackground =200;
  float HIGHTBackground = 60; 
  
   rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
   

   YBackground  = 225;
  
   rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
   
  popStyle();
  }
}
