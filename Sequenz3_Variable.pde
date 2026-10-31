/*
Class Sequenz2_Variable:

Responsible for:

- drawing the variable values in the screen of Sequenz3

*/
class Sequenz3_Variable{

  /*
  Function draw_VariableNumbers:
  
  - filters the needed data from the given arrays and passes the data to the following functions
  */
  public void draw_VariableNumbers(int[] getHIGHESTValues, int[]getLowestValues, String Selected_Joystick){
   
    int HX =0;
    int LX =0;
    
    int HY =0;
    int LY =0;
    
    
  if(getHIGHESTValues.length == 8 && getLowestValues.length == 8){
    //{  AX,   AY,   BX,   BY,   CX,   CY,   DX,   DY}
    switch (Selected_Joystick){
      case "C":
      HX = getHIGHESTValues[4];
      LX = getLowestValues [4];
      
      HY = getHIGHESTValues[5];
      LY = getLowestValues [5];
      break;
      
      case "B":
      HX = getHIGHESTValues[2];
      LX = getLowestValues [2];
       
      HY = getHIGHESTValues[3];
      LY = getLowestValues [3];
      break;
      
      case "D":
      HX = getHIGHESTValues[6];
      LX = getLowestValues [6];
      
      HY = getHIGHESTValues[7];
      LY = getLowestValues [7];
      break;
      
      case "A":
      HX = getHIGHESTValues[0];
      LX = getLowestValues [0];
      
      HY = getHIGHESTValues[1];
      LY = getLowestValues [1];
      break;
      };
    
    drawVariableValues(Selected_Joystick,HX,LX,HY,LY,getHIGHESTValues,getLowestValues);
    
  }
 }
private final drawText draw_Text = new drawText();

/*
Function drawVariableValues:

- uses the given strings to write the contained values one after the other into the specified line, at the end of the measurement series, a "}" is written
*/
private void drawVariableValues(String joystickLetter, int HIGHESTxValue, int LOWESTxValue, int HIGHESTyValue, int LOWESTyValue, int[] HIGHESTValues, int[] LOWESTValues) {
  pushStyle();

 Background (BLACK);

 float TextLengthOfMaxValues =470;
 float TextLengthOfMinValues =470;
 String Komma = ", ";

for(int i =0; i < HIGHESTValues.length && i < LOWESTValues.length; i++){
  
  textSize(21);
 
    if(i < HIGHESTValues.length-1) {Komma = ",  ";}else{Komma = "   "+"}";}
    draw_Text.draw_Text(
    str(HIGHESTValues[i]) + Komma,
    TextLengthOfMaxValues,
    176,
    25,
    RED,
    LEFT,
    CENTER
    );
    TextLengthOfMaxValues += textWidth(str(HIGHESTValues[i])) + textWidth(Komma);


    if(i < LOWESTValues.length-1) {Komma = ",  ";}else{Komma = "   "+"}";}
    draw_Text.draw_Text(
    str(LOWESTValues[i]) + Komma,
    TextLengthOfMinValues,
    254,
    25,
    RED,
    LEFT,
    CENTER
    );
    TextLengthOfMinValues += textWidth(str(LOWESTValues[i]))+ textWidth(Komma);
}

  draw_Text.draw_Text(
    str(LOWESTxValue),
    805,
    326,
    52,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    str(HIGHESTxValue),
    805,
    393,
    52,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    str(LOWESTyValue),
    805,
    463,
    52,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    str(HIGHESTyValue),
    805,
    532,
    52,
    RED,
    LEFT,
    CENTER
  );
   
pushStyle();

textSize(28);
// Breiten fuer exakte Anschlusspositionen
float highestWidth = textWidth("Highest reached ");
float lowestWidth  = textWidth("Lowest reached ");

popStyle();

draw_Text.draw_Text(
  joystickLetter+ "X Value:",
  318 + highestWidth,
  326,
  28,
  RED,
  LEFT,
  CENTER
);


draw_Text.draw_Text(
  joystickLetter + "X Value:",
  318 + lowestWidth,
  393,
  28,
  RED,
  LEFT,
  CENTER
);

draw_Text.draw_Text(
  joystickLetter + "Y Value:",
  318 + highestWidth,
  463,
  28,
  RED,
  LEFT,
  CENTER
);

draw_Text.draw_Text(
  joystickLetter + "Y Value:",
  318 + lowestWidth,
  532,
  28,
  RED,
  LEFT,
  CENTER
);
   popStyle();
}

private void Background (color BackgroundColor){
   pushStyle();
   
   noStroke();
   
  float XBackground =460;
  float YBackground  = 145;
  float LENGTHBackground =540;
  float HIGHTBackground =60;
  
   fill(BackgroundColor);
    // Min Vals 
    rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
   

   YBackground  = 225;
    // Max Vals
    rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
    
   XBackground =525;
   YBackground  = 295;
   LENGTHBackground =475;
    // H AX Value
    rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
    
    XBackground =520;
    YBackground  =365;
    // L AX Value
    rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
    
   YBackground  =432;
    // H AY Value
    rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
    
    YBackground  =505;
    HIGHTBackground =55;  
    // L AY Value
    rect(
    XBackground,
    YBackground,
    LENGTHBackground,
    HIGHTBackground);
   
    popStyle(); 
}
}
