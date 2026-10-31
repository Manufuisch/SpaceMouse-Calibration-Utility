/*
Class Sequenz1:

Responsible for:

- drawing the static objects that doesn´t change if Sequenz1 is activated (Sequenz1 == Hall Joystick Function Test)

*/
class Sequenz1 {
 
 private final drawText draw_Text = new drawText(); 
  
 private final draw_Icons newIcons = new draw_Icons();
 
 /*
 Funcation draw_Sequenz1:
 
 - draws the necessary Icons 
 - draws the frame
 - draws the explanation text
 - if showstyle enabled it draws dummy values in the section where the variable values will be written (only necessary for building the menue!)
 
 */
 public void draw_Sequenz1(boolean ShowStyle){
 
 background(BLACK);
 
 drawFrame();
 
 drawText();
 
 if(ShowStyle == true)drawValues("A", 155, 100);
 
 //Next Arrow
 newIcons.draw_Icon( 890.0, 39.0, 4.0, Icons_Available.Arrow, 960.0, 39.0,  RED);
 
 //Green X Arrow
 newIcons.draw_Icon(915.5, 514.0, 10.0, Icons_Available.Arrow, 915.5, 340.0, GREEN);
 
 //Yellow X Arrow
 newIcons.draw_Icon(917.5, 534.0, 10.0, Icons_Available.Arrow, 917.5, 708.0, YELLOW);
 
 // Green Y Arrow
 newIcons.draw_Icon(903.5, 525.0, 10.0, Icons_Available.Arrow,  840.5, 525.0, BLUE);
 
 //Yellow Y Arrow
 newIcons.draw_Icon(929.0, 522.0, 10.0, Icons_Available.Arrow,  994.0,522.0, ORANGE);
 
 //Reset Arrow
 newIcons.draw_Icon( 936.0, 108.0, 1.0, Icons_Available.ResetArrow); 
 
 //Spacemouse
 newIcons.draw_Icon( 154.5, 501.0, 1.03,Icons_Available.Spacemouse);
 
 //Joystick
 newIcons.draw_Icon( 685,522.0f,1.0, Icons_Available.Joystick);
 
 // first green check mark
 newIcons.draw_Icon(480,318,0.68,Icons_Available.CheckArrow);

 // second green check mark
 newIcons.draw_Icon(480,564,0.68,Icons_Available.CheckArrow);
 }
  /*
  Function drawFrame:
  
  - KI - Generated Function
  - creates the frame of the Sequenz1
  
  */
 private void drawFrame() {
  pushStyle();

  // Completely cover the existing menu.
  background(BLACK);

  // Window layout: 1006 x 754 px
  final float LEFT   = 3;
  final float RIGHT  = 1003;
  final float TOP    = 3;
  final float BOTTOM = 751;

  // Main layout
  final float HEADER_BOTTOM = 138;

  // Left graphics panel
  final float LEFT_COLUMN = 306;
  final float JOYSTICK_ROW_BOTTOM = 249;

  // Center / right divider
  final float VALUES_LEFT = 602;

  // Skip / Reset section in the upper-right corner
  final float ACTION_LEFT =  734;
  final float ACTION_SPLIT_Y = 77;

  // AX / AY sections on the right
  final float AX_BOTTOM = 215;
  final float AY_BOTTOM = 292;

  stroke(RED);
  strokeWeight(2);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  noFill();

  // Outer frame
  rect(
    LEFT,
    TOP,
    RIGHT - LEFT,
    BOTTOM - TOP
  );

  // Header
  line(
    LEFT,
    HEADER_BOTTOM,
    RIGHT,
    HEADER_BOTTOM
  );

  // Left panel / center section
  line(
    LEFT_COLUMN,
    HEADER_BOTTOM,
    LEFT_COLUMN,
    BOTTOM
  );

  // Bottom border of the "Joystick:" section
  line(
    LEFT,
    JOYSTICK_ROW_BOTTOM,
    LEFT_COLUMN,
    JOYSTICK_ROW_BOTTOM
  );
  

  // Right-hand value column
  line(
    VALUES_LEFT,
    HEADER_BOTTOM,
    VALUES_LEFT,
    BOTTOM
  );

  // AX bottom border
  line(
    VALUES_LEFT,
    AX_BOTTOM,
    RIGHT,
    AX_BOTTOM
  );

  // AY bottom border
  line(
    VALUES_LEFT,
    AY_BOTTOM,
    RIGHT,
    AY_BOTTOM
  );

  // Action section in the upper-right corner
  line(
    ACTION_LEFT,
    TOP,
    ACTION_LEFT,
    HEADER_BOTTOM
  );

  // Skip / Reset divider
  line(
    ACTION_LEFT,
    ACTION_SPLIT_Y,
    RIGHT,
    ACTION_SPLIT_Y
  );

  popStyle();
}

/*
 Function drawText:
 
 - KI - Generated Function
 - creates the explanaiton text in Sequenz1
  
*/

private void drawText() {
  pushStyle();



// INSTRUCTION TEXT - CENTER PANEL
// Vertically centered + larger font
//
// Approximate center panel dimensions:
// X = 306 to 602
// Y = 138 to 751
final float FT_TEXT_X    = 320.0;
final float FT_TEXT_SIZE = 22.0;


// CALCULATE TEXT WIDTHS
// Ensures separate text segments align seamlessly.

textSize(FT_TEXT_SIZE);

float ftW_top          = textWidth("the top");
float ftW_down         = textWidth(", down")+12;
float ftW_bottom       = textWidth("to the bottom");

float ftW_Xgoes        = textWidth("X goes from ")+12;
float ftW_Ygoes        = textWidth("Y goes from ")+12;

float ftW_to           = textWidth("to ");
float ftW_lower        = textWidth("lower value")+12;

float ftW_left         = textWidth("left");
float ftW_leftToRight  = textWidth(" to ");

// X - JOYSTICK FROM TOP TO BOTTOM

draw_Text.draw_Text(
  "X: Move the joystick from",
  FT_TEXT_X,
  208,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);


// "the top" and "to bottom" are intentionally drawn separately

float ftXLine2 = FT_TEXT_X;


// "the top"
draw_Text.draw_Text(
  "the top",
  ftXLine2,
  236,
  FT_TEXT_SIZE,
  GREEN,
  LEFT,
  CENTER
);

ftXLine2 += ftW_top;


// Regular text between highlighted segments
draw_Text.draw_Text(
  ", down ",
  ftXLine2,
  236,
  FT_TEXT_SIZE,
   RED,
  LEFT,
  CENTER
);

ftXLine2 += ftW_down;


// "to bottom"
draw_Text.draw_Text(
  "to the bottom",
  ftXLine2,
  236,
  FT_TEXT_SIZE,
  YELLOW,
  LEFT,
  CENTER
);

ftXLine2 += ftW_bottom;



// BLANK LINE


// X: LOWER -> HIGHER

float ftXLowerLine = FT_TEXT_X;


// Regular text
draw_Text.draw_Text(
  "X goes from ",
  ftXLowerLine,
  290,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

ftXLowerLine += ftW_Xgoes;


// "lower value"
draw_Text.draw_Text(
  "lower value",
  ftXLowerLine,
  290,
  FT_TEXT_SIZE,
  GREEN,
  LEFT,
  CENTER
);


// Next line
float ftXHigherLine = FT_TEXT_X;


// Regular text
draw_Text.draw_Text(
  "to ",
  ftXHigherLine,
  318,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

ftXHigherLine += ftW_to;


// "higher value"
draw_Text.draw_Text(
  "higher value",
  ftXHigherLine,
  318,
  FT_TEXT_SIZE,
  YELLOW,
  LEFT,
  CENTER
);


// BLANK LINE


// X: HIGHER -> LOWER

float ftXInvertLine1 = FT_TEXT_X;


// Regular text
draw_Text.draw_Text(
  "X goes from ",
  ftXInvertLine1,
  372,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

ftXInvertLine1 += ftW_Xgoes;


// "higher value"
draw_Text.draw_Text(
  "higher value",
  ftXInvertLine1,
  372,
  FT_TEXT_SIZE,
  GREEN,
  LEFT,
  CENTER
);


// Next line
float ftXInvertLine2 = FT_TEXT_X;


// Regular text
draw_Text.draw_Text(
  "to ",
  ftXInvertLine2,
  400,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

ftXInvertLine2 += ftW_to;


// "lower value"
draw_Text.draw_Text(
  "lower value",
  ftXInvertLine2,
  400,
  FT_TEXT_SIZE,
  YELLOW,
  LEFT,
  CENTER
);

ftXInvertLine2 += ftW_lower;


// End of sentence
draw_Text.draw_Text(
  ": invert X",
  ftXInvertLine2,
  400,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);


// BLANK LINE


// Y - JOYSTICK FROM LEFT TO RIGHT

draw_Text.draw_Text(
  "Y: Move the joystick from",
  FT_TEXT_X,
  454,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);


// "left" and "right" are intentionally drawn separately

float ftYDirectionLine = FT_TEXT_X;


// "left"
draw_Text.draw_Text(
  "left",
  ftYDirectionLine,
  482,
  FT_TEXT_SIZE,
  BLUE,
  LEFT,
  CENTER
);

ftYDirectionLine += ftW_left;


// Regular text between highlighted segments
draw_Text.draw_Text(
  " to ",
  ftYDirectionLine,
  482,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

ftYDirectionLine += ftW_leftToRight;


// "right"
draw_Text.draw_Text(
  "right",
  ftYDirectionLine,
  482,
  FT_TEXT_SIZE,
  ORANGE,
  LEFT,
  CENTER
);


// BLANK LINE


// Y: LOWER -> HIGHER

float ftYLowerLine = FT_TEXT_X;


// Regular text
draw_Text.draw_Text(
  "Y goes from ",
  ftYLowerLine,
  536,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

ftYLowerLine += ftW_Ygoes;


// "lower value"
draw_Text.draw_Text(
  "lower value",
  ftYLowerLine,
  536,
  FT_TEXT_SIZE,
  BLUE,
  LEFT,
  CENTER
);


// Next line
float ftYHigherLine = FT_TEXT_X;


// Regular text
draw_Text.draw_Text(
  "to ",
  ftYHigherLine,
  564,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

ftYHigherLine += ftW_to;


// "higher value"
draw_Text.draw_Text(
  "higher value",
  ftYHigherLine,
  564,
  FT_TEXT_SIZE,
  ORANGE,
  LEFT,
  CENTER
);


// BLANK LINE


// PINLIST NOTE

draw_Text.draw_Text(
  "If another output shows",
  FT_TEXT_X,
  618,
  FT_TEXT_SIZE,
   RED,
  LEFT,
  CENTER
);

draw_Text.draw_Text(
  "movement: swap pins in",
  FT_TEXT_X,
  646,
  FT_TEXT_SIZE,
  RED,
  LEFT,
  CENTER
);

draw_Text.draw_Text(
  "the PINLIST.",
  FT_TEXT_X,
  674,
  FT_TEXT_SIZE,
   RED,
  LEFT,
  CENTER
);

  // Title
  draw_Text.draw_Text(
    "Hall Joystick Function Test",
    18,
    73,
    54,
    RED,
    LEFT,
    CENTER
  );

  // Joystick row
  draw_Text.draw_Text(
    "Joystick:",
    16,
    195,
    36,
    RED,
    LEFT,
    CENTER
  );

  // Action fields
  draw_Text.draw_Text(
    "Next",
    750,
    40,
    32,
    RED,
    LEFT,
    CENTER
  );

 draw_Text.draw_Text(
    "Reset",
    750,
    108,
    31,
    RED,
    LEFT,
    CENTER
  );
  
  popStyle();

}
 /*
  Function drawValues:
  
  - KI - Generated Function
  - draws dummy values in the places where the variable values should be written
  
*/
private void drawValues(String joystickLetter, int axValue, int ayValue) {
  pushStyle();

  // Axis labels
  draw_Text.draw_Text(
    "A",
    620,
    176,
    36,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "A",
    620,
    253,
    36,
    RED,
    LEFT,
    CENTER
  );

  // Joystick letter
  draw_Text.draw_Text(
    joystickLetter,
    190,
    192,
    40,
    RED,
    CENTER,
    CENTER
  );

  // AX
  draw_Text.draw_Text(
    str(axValue),
    708,
    176,
    36,
    RED,
    LEFT,
    CENTER
  );

  // AY
  draw_Text.draw_Text(
    str(ayValue),
    708,
    253,
    36,
    RED,
    LEFT,
    CENTER
  );
  popStyle();
} 
}
  
  
  
