/*
Class Sequenz2_Variable:

Responsible for:

- drawing the variable values in the screen of Sequenz2

*/
class Sequenz2_Variable{
 
 private int X =0;
 private int Y =0;
  /*
 Function draw_VaribaleNumbers:
 
 - filters the needed data from the given array and passes the data to the following functions
 */
  public void draw_VariableNumbers(int[] getValues, String Selected_Joystick, color ColourRectangularX, color ColourRectangularY){
    
  if(getValues.length == 2){
  
    Background(BLACK);
    
    String SelectedJoystick   = Selected_Joystick;
    if(getValues[0] != 0) X   = getValues[0];
    if(getValues[1] != 0) Y   = getValues[1];
    
    drawVariableValues(SelectedJoystick,X,Y);
   
    drawValueRect(495.0, 254.0, 1.0, ColourRectangularX);
    
    drawValueRect(846.0, 254.0, 1.0, ColourRectangularY);
  }
 }
 
private final drawText draw_Text = new drawText();
/*
Function drawVariableValues:

- formates the int values as string
- uses the given data to write it in the places where the variable values have to be wirtten

Variable Values in Sequenz2:
- letter before "X"
- letter before "Y"
- XValues after "X:"
- YValues after "Y:"

*/
private void drawVariableValues(String joystickLetter, int xValue, int yValue) {

   draw_Text.draw_Text(
    joystickLetter + "X:",
    319,
    257,
    36,
    RED,
    LEFT,
    CENTER
  );


   draw_Text.draw_Text(
    joystickLetter + "Y:",
    670,
    257,
    36,
    RED,
    LEFT,
    CENTER
  );

  // AX Value
  draw_Text.draw_Text(
    str(xValue),
    495,
    254,
    52,
    RED,
    CENTER,
    CENTER
  );

  //AY Value
  draw_Text.draw_Text(
    str(yValue),
    846,
    254,
    52,
    RED,
    CENTER,
    CENTER
  );
}
    
  private void drawValueRect(
  double x,
  double y,
  double size,
  int rectColor
) {
  pushMatrix();
  pushStyle();

  translate(
    (float)x,
    (float)y
  );

  scale(
    (float)size
  );

  stroke(rectColor);
  strokeWeight(2);
  noFill();

  rectMode(CENTER);

  rect(
    0,
    0,
    162,
    64
  );

  rectMode(CORNER);

  popStyle();
  popMatrix();
}
  
  /*
 Function Background:
 
 - draws black squares over the previous variable value columns, before each new drawing of the variable numbers

 */
private void Background (color BackgroundColor){
 
    pushStyle();
    
    noStroke();
    
    float XBackground =315;
    float YBackground  = 220;
    float LENGTHBackground =300;
    float HIGHTBackground =70;
  
    fill(BackgroundColor);
  
    rect(XBackground,YBackground,LENGTHBackground,HIGHTBackground);
    
    XBackground =665;
    
    rect(XBackground,YBackground,LENGTHBackground,HIGHTBackground);
  
    popStyle();
  
  
}
}
