/*
Class Sequenz3:

Responsible for:

- drawing the static objects that doesn´t change if Sequenz3 is activated (Sequenz3 == Min/ Max Calibration)

*/
 class Sequenz3 {

 private draw_Icons newIcons = new draw_Icons();
 
 private final drawText draw_Text  = new drawText();
  /*
 Funcation draw_Sequenz3:
 
 - draws the necessary Icons 
 - draws the frame
 - draws the explanation text
 - if showstyle enabled it draws dummy values in the section where the variable values will be written (only necessary for building the menue!)
 
 */
 public void draw_Sequenz3(boolean ShowStyle){

 background(BLACK);
 
 drawFrame();
 drawText();

 
 if(ShowStyle == true)drawValues("A", 155, 100,255,255); 
 
 //Next Arrow
 newIcons.draw_Icon( 890.0, 39.0, 4.0, Icons_Available.Arrow, 960.0, 39.0,  RED);
 
 //Reset Arrow
 newIcons.draw_Icon( 936.0, 108.0, 1.0, Icons_Available.ResetArrow); 
 
 //Spacemouse
 newIcons.draw_Icon(154.5, 501.0, 1.03,Icons_Available.Spacemouse);

 }
 /*
 Function drawFrame:
  
 - KI - Generated Function
 - creates the frame of the Sequenz3
 
 */ 
private void drawFrame() {
  pushStyle();

  // background(0);

  final float LEFT   = 3;
  final float RIGHT  = 1003;
  final float TOP    = 3;
  final float BOTTOM = 751;

  final float HEADER_BOTTOM = 138;

  final float ACTION_LEFT = 734;
  final float ACTION_SPLIT_Y = 77;

  final float LEFT_COLUMN = 306;
  final float LEFT_LABEL_BOTTOM = 249;

  final float RIGHT_TOP_LINE_1 = 214;  // Below "minVals"
  final float RIGHT_TOP_LINE_2 = 292;  // Below "maxVals"

  final float RIGHT_INFO_1 = 359;      // Highest reached AX Value
  final float RIGHT_INFO_2 = 427;      // Lowest reached AX Value
  final float RIGHT_INFO_3 = 500;      // Highest reached AY Value
  final float RIGHT_INFO_4 = 564;      // Lowest reached AY Value

  stroke(RED);
  strokeWeight(2);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  noFill();

  // Outer border
  rect(
    LEFT,
    TOP,
    RIGHT - LEFT,
    BOTTOM - TOP
  );

  // Header bottom border
  line(
    LEFT,
    HEADER_BOTTOM,
    RIGHT,
    HEADER_BOTTOM
  );

  // Next / Reset section
  line(
    ACTION_LEFT,
    TOP,
    ACTION_LEFT,
    HEADER_BOTTOM
  );

  line(
    ACTION_LEFT,
    ACTION_SPLIT_Y,
    RIGHT,
    ACTION_SPLIT_Y
  );

  // Left column
  line(
    LEFT_COLUMN,
    HEADER_BOTTOM,
    LEFT_COLUMN,
    BOTTOM
  );

  // Bottom border of "Joystick:"
  line(
    LEFT,
    LEFT_LABEL_BOTTOM,
    LEFT_COLUMN,
    LEFT_LABEL_BOTTOM
  );

  // Right-side horizontal dividers
  line(
    LEFT_COLUMN,
    RIGHT_TOP_LINE_1,
    RIGHT,
    RIGHT_TOP_LINE_1
  );

  line(
    LEFT_COLUMN,
    RIGHT_TOP_LINE_2,
    RIGHT,
    RIGHT_TOP_LINE_2
  );

  line(
    LEFT_COLUMN,
    RIGHT_INFO_1,
    RIGHT,
    RIGHT_INFO_1
  );

  line(
    LEFT_COLUMN,
    RIGHT_INFO_2,
    RIGHT,
    RIGHT_INFO_2
  );

  line(
    LEFT_COLUMN,
    RIGHT_INFO_3,
    RIGHT,
    RIGHT_INFO_3
  );

  line(
    LEFT_COLUMN,
    RIGHT_INFO_4,
    RIGHT,
    RIGHT_INFO_4
  );

  popStyle();
}
/*
 Function drawText:
 
 - KI - Generated Function
 - creates the explanaiton text in Sequenz3
  
*/
private void drawText() {

  // HEADER
  draw_Text.draw_Text(
    "Min/Max Calibration",
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

  // UPPER-LEFT SECTION
  draw_Text.draw_Text(
    "Joystick:",
    16,
    195,
    36,
    RED,
    LEFT,
    CENTER
  );

  // MINVALS / MAXVALS
  // IMPORTANT:
  // "minVals" and "maxVals" are NOT rendered.
  // Only the actual array headings are rendered.
  draw_Text.draw_Text(
    "MINVALS {",
    320,
    176,
    25,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "MAXVALS {",
    320,
    254,
    25,
    RED,
    LEFT,
    CENTER
  );

  // 4 LABEL ROWS
  // The "A" in AX / AY is rendered separately in each case.
  pushStyle();

  textSize(28);

  popStyle();

  // Highest reached AX Value:
  draw_Text.draw_Text(
    "Highest reached ",
    318,
    326,
    28,
    RED,
    LEFT,
    CENTER
  );

  // Lowest reached AX Value:
  draw_Text.draw_Text(
    "Lowest reached ",
    318,
    393,
    28,
    RED,
    LEFT,
    CENTER
  );

  // Highest reached AY Value:
  draw_Text.draw_Text(
    "Highest reached ",
    318,
    463,
    28,
    RED,
    LEFT,
    CENTER
  );

  // Lowest reached AY Value:
  draw_Text.draw_Text(
    "Lowest reached ",
    318,
    532,
    28,
    RED,
    LEFT,
    CENTER
  );

  // EXPLANATORY TEXT IN THE BOTTOM-RIGHT SECTION
  // Improved vertical centering
  final float INFO_X = 348.0;
  final float INFO_SIZE = 18.0;

  // Paragraph 1
  draw_Text.draw_Text(
    "Move the SpaceMouse along the X-axis and increase the X value",
    INFO_X,
    596,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "until no higher reading can be reached.",
    INFO_X,
    620,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  // Paragraph 2
  draw_Text.draw_Text(
    "Repeat this procedure for all X min./-max. and Y min./-max. values.",
    INFO_X,
    658,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  // Paragraph 3
  draw_Text.draw_Text(
    "Once completed, the full range values for all axes are available",
    INFO_X,
    696,
    INFO_SIZE,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "and can be entered into the corresponding arrays in `config.h`.",
    INFO_X,
    720,
    INFO_SIZE,
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
  int highestAX,
  int lowestAX,
  int highestAY,
  int lowestAY
) {

  // JOYSTICK LETTER
  draw_Text.draw_Text(
    joystickLetter,
    243,
    193,
    50,
    RED,
    LEFT,
    CENTER
  );

  // MINVALS / MAXVALS
  // All elements previously marked in "blue" are rendered here,
  // but remain red in the final display.
  draw_Text.draw_Text(
    "-265, -260, -250, -230, -250, -510, -250, -230",
    470,
    176,
    21,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    "265, 510, 250, 450, 250, 260, 250, 450",
    470,
    254,
    21,
    RED,
    LEFT,
    CENTER
  );

  // HIGHEST / LOWEST VALUES
  // All values moved up by one row
  draw_Text.draw_Text(
    str(highestAX),
    805,
    326,
    52,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    str(lowestAX),
    805,
    393,
    52,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    str(highestAY),
    805,
    463,
    52,
    RED,
    LEFT,
    CENTER
  );

  draw_Text.draw_Text(
    str(lowestAY),
    805,
    532,
    52,
    RED,
    LEFT,
    CENTER
  );
}

}
