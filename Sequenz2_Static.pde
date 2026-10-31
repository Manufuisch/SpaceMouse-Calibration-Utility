/*
Class Sequenz2:

Responsible for:

- drawing the static objects that doesn´t change if Sequenz2 is activated (Sequenz2 == Mechanical Centering)

*/
class Sequenz2 {

 private final draw_Icons newIcons = new draw_Icons();
 
 private final drawText draw_Text  = new drawText();
  /*
 Funcation draw_Sequenz2:
 
 - draws the necessary Icons 
 - draws the frame
 - draws the explanation text
 - if showstyle enabled it draws dummy values in the section where the variable values will be written (only necessary for building the menue!)
 
 */
 public void draw_Sequenz2(boolean ShowStyle){

 background(BLACK);
 
 drawFrame();
 drawText();
 
 if(ShowStyle == true){drawValues("A", 155, 100); drawValueRect(495.0, 254.0, 1.0, GREEN); drawValueRect(846.0, 254.0, 1.0, GREEN);}
 
 //Next Arrow
 newIcons.draw_Icon( 890.0, 39.0, 4.0, Icons_Available.Arrow, 960.0, 39.0,  RED);
 
 //Reset Arrow
 newIcons.draw_Icon( 936.0, 108.0, 1.0, Icons_Available.ResetArrow); 
 
 //Spacemouse
 newIcons.draw_Icon(154.5, 501.0, 1.03,Icons_Available.Spacemouse);
 
 //green check mark
 newIcons.draw_Icon(  720.0, 664.0, 1.05, Icons_Available.CheckArrow);
 }
 
 /*
 Function drawFrame:
  
 - KI - Generated Function
 - creates the frame of the Sequenz2
 
 */ 
private void drawFrame() {
  pushStyle();

  background(0);

  final int UI_RED = #FF2323;

  final float LEFT   = 3;
  final float RIGHT  = 1003;
  final float TOP    = 3;
  final float BOTTOM = 751;

  final float HEADER_BOTTOM = 138;

  final float ACTION_LEFT = 734;
  final float ACTION_SPLIT_Y = 77;

  final float LEFT_COLUMN = 306;
  final float LEFT_LABEL_BOTTOM = 249;

  final float TOP_INFO_BOTTOM = 214;
  final float VALUE_ROW_BOTTOM = 292;

  final float AX_AY_SPLIT_X = 654;

  stroke(UI_RED);
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

  // Bottom edge of the header
  line(
    LEFT,
    HEADER_BOTTOM,
    RIGHT,
    HEADER_BOTTOM
  );

  // Next/Reset column
  line(
    ACTION_LEFT,
    TOP,
    ACTION_LEFT,
    HEADER_BOTTOM
  );

  // Next / Reset divider
  line(
    ACTION_LEFT,
    ACTION_SPLIT_Y,
    RIGHT,
    ACTION_SPLIT_Y
  );

  // Main left column
  line(
    LEFT_COLUMN,
    HEADER_BOTTOM,
    LEFT_COLUMN,
    BOTTOM
  );

  // Bottom edge of the "Joystick:" section
  line(
    LEFT,
    LEFT_LABEL_BOTTOM,
    LEFT_COLUMN,
    LEFT_LABEL_BOTTOM
  );

  // Upper information row on the right
  line(
    LEFT_COLUMN,
    TOP_INFO_BOTTOM,
    RIGHT,
    TOP_INFO_BOTTOM
  );

  // Bottom edge of the AX/AY row
  line(
    LEFT_COLUMN,
    VALUE_ROW_BOTTOM,
    RIGHT,
    VALUE_ROW_BOTTOM
  );

  // AX / AY divider
  line(
    AX_AY_SPLIT_X,
    TOP_INFO_BOTTOM,
    AX_AY_SPLIT_X,
    VALUE_ROW_BOTTOM
  );

  popStyle();
}
 /*
  Function drawValueRect:
  
  - KI - Generated Function
  - draws dummy rects in the places where the variable rects should be written
  
*/
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
 Function drawText:
 
 - KI - Generated Function
 - creates the explanaiton text in Sequenz2
  
*/
private void drawText() {

  // HEADER
  draw_Text.draw_Text(
    "Mechanical Centering",
    18,
    72,
    54,
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

  // UPPER SECTION
  draw_Text.draw_Text(
    "Joystick:",
    16,
    195,
    36,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "YT:",
    319,
    182,
    36,
    RED,
    LEFT,
    CENTER
  );

  // INFORMATION TEXT
  // Large field on the right:
  // X approx. 303 - 1000
  // Y approx. 294 - 751
  // The entire block is now positioned higher and is more compact.

  final float INFO_X = 352.0;
  final float INFO_SIZE = 20.0;

  // Paragraph 1
  draw_Text.draw_Text(
    "Refer to the linked YouTube video",
    INFO_X,
    326,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "for detailed instructions on how to",
    INFO_X,
    353,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "mechanically center the joysticks.",
    INFO_X,
    380,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  // BLANK LINE

  // Paragraph 2
  draw_Text.draw_Text(
    "All joysticks should remain untouched",
    INFO_X,
    426,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "and be in IDLE mode.",
    INFO_X,
    453,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  // BLANK LINE

  // Paragraph 3
  draw_Text.draw_Text(
    "The theoretical ideal center position is:",
    INFO_X,
    499,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "X: 512, Y: 512",
    INFO_X,
    526,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  // BLANK LINE

  // Paragraph 4
  draw_Text.draw_Text(
    "In practice, a deviation of",
    INFO_X,
    572,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "approximately ±5 is considered optimal.",
    INFO_X,
    599,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  // COLOR VALUES

  // RED
  draw_Text.draw_Text(
    "Red",
    352,
    649,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    ": ±20",
    391,
    649,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  // ORANGE
  draw_Text.draw_Text(
    "Orange",
    352,
    678,
    INFO_SIZE,
    ORANGE,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    ": ±10",
    424,
    678,
    INFO_SIZE,
    ORANGE,
    LEFT,
    CENTER
  );

  // YELLOW
  draw_Text.draw_Text(
    "Yellow",
    557,
    649,
    INFO_SIZE,
    YELLOW,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    ": ±5",
    624,
    649,
    INFO_SIZE,
    YELLOW,
    LEFT,
    CENTER
  );

  // GREEN
  draw_Text.draw_Text(
    "Green",
    557,
    678,
    INFO_SIZE,
    GREEN,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    ": 512",
    619,
    678,
    INFO_SIZE,
    GREEN,
    LEFT,
    CENTER
  );

  // Tutorial link value
  draw_Text.draw_Text(
    "https://www.youtube.com/watch?v=6JX_kdyDnlM",
    400,
    182,
    25,
    RED,
    LEFT,
    CENTER
  );

}
 /*
  Function drawValues:
  
  - KI - Generated Function
  - draws dummy values in the places where the variable values should be written
  
*/
void drawValues(
  String joystickLetter,
  int axValue,
  int ayValue
) {

  draw_Text.draw_Text(
    "A",
    319,
    257,
    36,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "A",
    670,
    257,
    36,
    RED,
    LEFT,
    CENTER
  );

  // Joystick letter
  draw_Text.draw_Text(
    joystickLetter,
    200,
    193,
    50,
    RED,
    LEFT,
    CENTER
  );

  // AX value
  draw_Text.draw_Text(
    str(axValue),
    495,
    254,
    52,
    RED,
    CENTER,
    CENTER
  );

  // AY value
  draw_Text.draw_Text(
    str(ayValue),
    846,
    254,
    52,
    RED,
    CENTER,
    CENTER
  );
}
}
