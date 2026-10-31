/*

Class draw_Icons:

Responsible for:

- drawing the icons needed in different Sequenzes in the specified sizes

Available Icons:
Spacemouse 
Joystick
ResetArrow
CheckArrow
Arrow

*/
class draw_Icons {
 
/*
Function draw_Icon 1/draw_Icon 2 :

- overloaded functions because you need more additional data for the arrow function than for all the other icons
- StateMachine which chooses the needed function for the named Icon that has to be drawn

*/
 public void draw_Icon(double x, double y, double size, Icons_Available Icon){//1
   
 switch (Icon){
   case Spacemouse:
   draw_Spacemouse(x,y,size);
   break;
    
   case Joystick:
    draw_Joystick(x,y,size);
   break;
   
   case ResetArrow:
    draw_ResetArrow(x,y,size);
   break;
   
   case CheckArrow:
    draw_CheckArrow (x,y,size);
   break;
   
   case Arrow:
   //Placeholder
   break;
   
};
}

 public void draw_Icon(double x, double y, double thickness, Icons_Available Icon, double endx, double endy, color colour){//1
   
 if( Icon.equals(Icons_Available.Arrow))draw_Arrow(x, y, thickness, endx, endy, colour);
 
 }
  
  /*
  Function draw_Spacemouse:
  
  - KI - Generated Icon
  - creates the icon in the specified sizes
  
  */
  private void draw_Spacemouse(double x, double y, double size){
    
  pushMatrix();
  pushStyle();

  translate((float)x, (float)y);
  scale((float)size);

  float bx = -131.0;
  float by = -159.5;
  float w  = 262.0;
  float h  = 319.0;
  float cx = 0.0;


  // SMALL UPPER SHOT / NOSE

  stroke(#FF2323);
  strokeWeight(3);
  strokeJoin(ROUND);
  strokeCap(ROUND);

  fill(#070707);

  rectMode(CENTER);

  rect(
    cx,
    by + 5,
    30,
    10,
    4
  );

  rectMode(CORNER);

  // Ergonomic exterior shape

  stroke(#FF2323);
  strokeWeight(3);
  strokeJoin(ROUND);
  strokeCap(ROUND);

  fill(#070707);

  beginShape();

  // upper left of the center
  vertex(
    cx - 18,
    by + 12
  );


  // left shoulder
  bezierVertex(
    cx - 62, by + 14,
    bx + 49, by + 34,
    bx + 31, by + 75
  );


  // left side wall
  bezierVertex(
    bx + 18, by + 108,
    bx + 23, by + 161,
    bx + 17, by + 204
  );


  // lower left widening
  bezierVertex(
    bx + 13, by + 238,
    bx + 1,  by + 264,
    bx + 4,  by + 282
  );


  // left bottom curve
  bezierVertex(
    bx + 7,  by + 304,
    bx + 51, by + 317,
    cx,      by + h
  );


  // right bottom curve
  bezierVertex(
    bx + w - 51, by + 317,
    bx + w - 7,  by + 304,
    bx + w - 4,  by + 282
  );


  // lower right widening
  bezierVertex(
    bx + w - 1,  by + 264,
    bx + w - 13, by + 238,
    bx + w - 17, by + 204
  );


  // right side wall
  bezierVertex(
    bx + w - 23, by + 161,
    bx + w - 18, by + 108,
    bx + w - 31, by + 75
  );


  // right shoulder
  bezierVertex(
    bx + w - 49, by + 34,
    cx + 62,     by + 14,
    cx + 18,     by + 12
  );


  // upper curve
  bezierVertex(
    cx + 10, by + 8,
    cx - 10, by + 8,
    cx - 18, by + 12
  );

  endShape(CLOSE);

  // VERY SUBTLE INNER OUTLINE

  noFill();

  stroke(
    120,
    12,
    12,
    95
  );

  strokeWeight(1);

  beginShape();

  vertex(
    cx - 19,
    by + 20
  );

  bezierVertex(
    cx - 56, by + 21,
    bx + 58, by + 42,
    bx + 41, by + 79
  );

  bezierVertex(
    bx + 29, by + 111,
    bx + 34, by + 160,
    bx + 28, by + 204
  );

  bezierVertex(
    bx + 24, by + 237,
    bx + 14, by + 263,
    bx + 17, by + 278
  );

  bezierVertex(
    bx + 21, by + 296,
    bx + 61, by + 307,
    cx,      by + 309
  );

  bezierVertex(
    bx + w - 61, by + 307,
    bx + w - 21, by + 296,
    bx + w - 17, by + 278
  );

  bezierVertex(
    bx + w - 14, by + 263,
    bx + w - 24, by + 237,
    bx + w - 28, by + 204
  );

  bezierVertex(
    bx + w - 34, by + 160,
    bx + w - 29, by + 111,
    bx + w - 41, by + 79
  );

  bezierVertex(
    bx + w - 58, by + 42,
    cx + 56,     by + 21,
    cx + 19,     by + 20
  );

  endShape();

  // CENTRAL RING

  float ringY  = by + 118;
  float outerD = 132;
  float innerD = 104;


  // outer ring
  noFill();

  stroke(#FF2323);
  strokeWeight(3);

  ellipse(
    cx,
    ringY,
    outerD,
    outerD
  );


  // black inner area
  fill(#000000);

  stroke(#FF2323);
  strokeWeight(3);

  ellipse(
    cx,
    ringY,
    innerD,
    innerD
  );

  popStyle();
  popMatrix();
}

  /*
  Function draw_Joystick:
  
  - KI - Generated Icon
  - creates the icon in the specified sizes
  */  
  private void draw_Joystick(double x,double y, double size){
    
    
  pushMatrix();
  pushStyle();

  translate((float)x,(float) y);
  scale((float)size);

  noStroke();
  fill(0, 65);
  ellipse(8, 120, 235, 36);

  hallStickTop_drawTopSensor(0, -104);
  hallStickTop_drawRightSensor(104, 0);
  hallStickTop_drawBottomButton(0, 104);

  hallStickTop_drawHousing();

  popStyle();
  popMatrix();
}

// HELPER FUNCTIONS

private void hallStickTop_lerpFillEllipse(
  float x, float y,
  float w, float h,
  int c1, int c2,
  int steps
) {
  noStroke();

  for (int i = steps; i > 0; i--) {
    float t = map(i, steps, 1, 0, 1);

    fill(lerpColor(c1, c2, t));

    ellipse(
      x,
      y,
      w * (i / float(steps)),
      h * (i / float(steps))
    );
  }
}

private void hallStickTop_lerpFillRect(
  float x, float y,
  float w, float h,
  float r,
  int c1, int c2,
  int steps
) {
  noStroke();

  for (int i = 0; i < steps; i++) {

    float t = map(
      i,
      0,
      steps - 1,
      0,
      1
    );

    fill(lerpColor(c1, c2, t));

    float inset =
      i * (min(w, h) * 0.012);

    rect(
      x + inset,
      y + inset,
      w - inset * 2,
      h - inset * 2,
      max(0, r - inset * 0.2)
    );
  }
}

// MAIN HOUSING

private void hallStickTop_drawHousing() {

  // housing shadow
  noStroke();
  fill(0, 35);
  rect(
    -72,
    -68,
    146,
    146,
    10
  );


  // metallic main body
  hallStickTop_lerpFillRect(
    -74,
    -74,
    148,
    148,
    11,

    color(148, 150, 153),
    color(201, 203, 206),

    18
  );


  // outer frame
  stroke(
    108,
    111,
    115
  );

  strokeWeight(2.2);

  noFill();

  rect(
    -74,
    -74,
    148,
    148,
    11
  );

  // METAL FACETS

  noStroke();

  // top
  fill(
    220,
    222,
    224,
    85
  );

  quad(
    -66, -66,
    0,   -79,
    66,  -66,
    0,   -57
  );


  fill(
    240,
    241,
    242,
    35
  );

  quad(
    -60, -58,
    0,   -70,
    60,  -58,
    0,   -50
  );


  // right
  fill(
    174,
    177,
    181,
    60
  );

  quad(
    66, -66,
    79, 0,
    66, 66,
    55, 0
  );


  // left
  fill(
    154,
    157,
    161,
    65
  );

  quad(
    -66, -66,
    -55, 0,
    -66, 66,
    -79, 0
  );


  // bottom
  fill(
    130,
    133,
    137,
    75
  );

  quad(
    -66, 66,
    0,   56,
    66,  66,
    0,   78
  );

  // METAL CLIPS

  stroke(
    92,
    96,
    100
  );

  strokeWeight(3);

  line(
    -46,
    -61,
    -24,
    -61
  );

  line(
    24,
    -61,
    46,
    -61
  );

  line(
    61,
    -46,
    61,
    -24
  );

  line(
    61,
    24,
    61,
    46
  );

  line(
    -46,
    61,
    -24,
    61
  );

  line(
    24,
    61,
    46,
    61
  );


  // left side left empty
  stroke(
    108,
    111,
    114
  );

  strokeWeight(2);

  line(
    -61,
    -42,
    -61,
    42
  );

  // INNER OPENING

  hallStickTop_lerpFillEllipse(
    0,
    0,
    106,
    106,

    color(
      98,
      101,
      105
    ),

    color(
      48,
      52,
      58
    ),

    20
  );


  // outer inner ring
  stroke(
    174,
    177,
    181,
    140
  );

  strokeWeight(2);

  noFill();

  ellipse(
    0,
    0,
    103,
    103
  );


  // dark inner ring
  stroke(
    42,
    45,
    50,
    190
  );

  strokeWeight(2);

  ellipse(
    0,
    0,
    90,
    90
  );

  // Interior instead of white gimbal parts

  noStroke();

  // deep, dark recess
  fill(
    42,
    45,
    50
  );

  ellipse(
    0,
    4,
    74,
    74
  );


  // inner metal/plastic shell
  fill(
    68,
    72,
    78
  );

  ellipse(
    0,
    6,
    60,
    60
  );


  // lower shadow
  fill(
    24,
    27,
    31,
    120
  );

  arc(
    0,
    9,
    58,
    47,
    0,
    PI
  );


  // subtle upper highlight
  fill(
    135,
    140,
    146,
    50
  );

  arc(
    0,
    1,
    56,
    42,
    PI,
    TWO_PI
  );

  // STICK VIEWED FROM ABOVE

  // collar
  hallStickTop_lerpFillEllipse(
    0,
    -5,
    46,
    46,

    color(
      90,
      96,
      103
    ),

    color(
      45,
      49,
      55
    ),

    16
  );


  // stick head
  hallStickTop_lerpFillEllipse(
    0,
    -5,
    33,
    33,

    color(
      80,
      86,
      93
    ),

    color(
      34,
      38,
      44
    ),

    16
  );


  // hole in the center
  fill(
    18,
    21,
    25
  );

  ellipse(
    0,
    -5,
    12,
    12
  );


  // small reflection
  fill(
    255,
    255,
    255,
    38
  );

  ellipse(
    -7,
    -13,
    9,
    6
  );
}

// TOP HALL SENSOR

private void hallStickTop_drawTopSensor(
  float x,
  float y
) {

  pushMatrix();

  translate(
    x,
    y
  );


  // connection
  noStroke();

  fill(
    72,
    75,
    80
  );

  rect(
    -18,
    24,
    36,
    12,
    4
  );


  // Sensor
  hallStickTop_lerpFillRect(
    -44,
    -22,
    88,
    46,
    10,

    color(
      231,
      154,
      33
    ),

    color(
      248,
      185,
      67
    ),

    12
  );


  // shadow edge
  fill(
    179,
    114,
    20,
    80
  );

  rect(
    -42,
    8,
    84,
    12,
    6
  );


  // Highlight
  fill(
    255,
    224,
    140,
    45
  );

  rect(
    -36,
    -17,
    72,
    13,
    7
  );


  // Label
  fill(
    177,
    49,
    42
  );

  rect(
    -16,
    6,
    32,
    12,
    3
  );


  fill(
    22,
    20,
    18
  );

  textAlign(
    CENTER,
    CENTER
  );

  textSize(8);

  text(
    "BDX",
    0,
    12
  );


  // mounting holes
  noStroke();

  fill(
    165,
    110,
    28
  );

  ellipse(
    -26,
    10,
    7,
    7
  );

  ellipse(
    26,
    10,
    7,
    7
  );


  // Pins
  stroke(
    193,
    194,
    197
  );

  strokeWeight(3);

  line(
    -20,
    -22,
    -20,
    -35
  );

  line(
    0,
    -22,
    0,
    -35
  );

  line(
    20,
    -22,
    20,
    -35
  );


  popMatrix();
}

// RIGHT HALL SENSOR

private void hallStickTop_drawRightSensor(
  float x,
  float y
) {

  pushMatrix();

  translate(
    x,
    y
  );

  rotate(
    HALF_PI
  );


  // connection
  noStroke();

  fill(
    72,
    75,
    80
  );

  rect(
    -18,
    24,
    36,
    12,
    4
  );


  // Sensor
  hallStickTop_lerpFillRect(
    -44,
    -22,
    88,
    46,
    10,

    color(
      231,
      154,
      33
    ),

    color(
      248,
      185,
      67
    ),

    12
  );


  // shadow
  fill(
    179,
    114,
    20,
    80
  );

  rect(
    -42,
    8,
    84,
    12,
    6
  );


  // Highlight
  fill(
    255,
    224,
    140,
    45
  );

  rect(
    -36,
    -17,
    72,
    13,
    7
  );


  // Label
  fill(
    177,
    49,
    42
  );

  rect(
    -16,
    6,
    32,
    12,
    3
  );


  fill(
    22,
    20,
    18
  );

  textAlign(
    CENTER,
    CENTER
  );

  textSize(8);

  text(
    "BDX",
    0,
    12
  );


  // mounting holes
  noStroke();

  fill(
    165,
    110,
    28
  );

  ellipse(
    -26,
    10,
    7,
    7
  );

  ellipse(
    26,
    10,
    7,
    7
  );


  // Pins
  stroke(
    193,
    194,
    197
  );

  strokeWeight(3);

  line(
    -20,
    -22,
    -20,
    -35
  );

  line(
    0,
    -22,
    0,
    -35
  );

  line(
    20,
    -22,
    20,
    -35
  );


  popMatrix();
}

// BOTTOM PUSH BUTTON

private void hallStickTop_drawBottomButton(
  float x,
  float y
) {

  pushMatrix();

  translate(
    x,
    y
  );


  // support
  noStroke();

  fill(
    121,
    128,
    136
  );

  rect(
    -30,
    -10,
    60,
    22,
    5
  );


  // dark button housing
  hallStickTop_lerpFillRect(
    -38,
    -18,
    76,
    36,
    7,

    color(
      34,
      37,
      43
    ),

    color(
      71,
      75,
      83
    ),

    10
  );


  // metal plate
  hallStickTop_lerpFillRect(
    -24,
    -9,
    48,
    18,
    4,

    color(
      145,
      147,
      151
    ),

    color(
      196,
      198,
      202
    ),

    8
  );


  // push button
  hallStickTop_lerpFillEllipse(
    0,
    0,
    21,
    21,

    color(
      246,
      247,
      248
    ),

    color(
      205,
      209,
      212
    ),

    14
  );


  fill(
    220,
    223,
    226
  );

  ellipse(
    0,
    0,
    12,
    12
  );


  // screws
  fill(
    18,
    20,
    24
  );

  ellipse(
    -26,
    -10,
    6,
    6
  );

  ellipse(
    26,
    -10,
    6,
    6
  );

  ellipse(-
    -26,
    10,
    6,
    6
  );

  ellipse(
    26,
    10,
    6,
    6
  );


  // Pins
  stroke(
    192,
    193,
    196
  );

  strokeWeight(3);

  line(
    -18,
    18,
    -18,
    34
  );

  line(
    18,
    18,
    18,
    34
  );


  popMatrix();
}
   /*
  Function draw_ResetArrow:
  
  - KI - Generated Icon
  - creates the icon in the specified sizes
  
  */
 private void draw_ResetArrow(double x,double y,double size){
    pushMatrix();
  pushStyle();

  translate((float)x, (float)y);
  scale((float)size);

  final int RED       = #FF2323;
  final int DARK_RED  = #781010;
  final int LIGHT_RED = #FF6868;

  strokeCap(ROUND);
  strokeJoin(ROUND);

  // RESET CIRCLE

  // dark shadow outline
  noFill();
  stroke(DARK_RED);
  strokeWeight(6);

  arc(
    1.5,
    1.5,
    36,
    36,
    radians(42),
    radians(320)
  );

  // main red outline
  stroke(RED);
  strokeWeight(3.5);

  arc(
    0,
    0,
    36,
    36,
    radians(42),
    radians(320)
  );

  // SHARP ARROWHEAD
  
  pushMatrix();

  // arrowhead at the upper-right end of the circular arc
  translate(13.2, -12.7);

  // align tangentially to the circle
  rotate(radians(38));

  noStroke();

  // dark shadow behind the arrowhead
  fill(DARK_RED);

  beginShape();
  vertex(8, 0);      // truly pointed leading edge
  vertex(-7, -7);
  vertex(-4, 0);
  vertex(-7, 7);
  endShape(CLOSE);


  // main red arrowhead
  fill(RED);

  beginShape();
  vertex(7, 0);
  vertex(-6, -5);
  vertex(-3, 0);
  vertex(-6, 5);
  endShape(CLOSE);

  popMatrix();

  // SUBTLE HIGHLIGHT

  noFill();

  stroke(LIGHT_RED, 115);
  strokeWeight(1);

  arc(
    -0.8,
    -0.8,
    29,
    29,
    radians(72),
    radians(215)
  );


  popStyle();
  popMatrix();
}

  /*
  Function draw_Arrow:
  
  - KI - Generated Icon
  - creates the icon in the specified sizes
  
  */
private void draw_Arrow(
  double x,
  double y,
  double thickness,
  double endx,
  double endy,
  int arrowColor
) {

  pushMatrix();
  pushStyle();

  // convert values

  float startX  = (float)x;
  float startY  = (float)y;

  float finishX = (float)endx;
  float finishY = (float)endy;

  float t = max(
    1.0f,
    (float)thickness
  );

  // calculate direction and length

  float dx = finishX - startX;
  float dy = finishY - startY;

  float arrowLength = sqrt(
    dx * dx +
    dy * dy
  );


  // start and end are identical -> do not draw anything
  if (arrowLength < 0.001f) {
    popStyle();
    popMatrix();
    return;
  }


  float angle = atan2(
    dy,
    dx
  );

  // automatically derive colors from the selected main color

  int mainColor = arrowColor;

  int darkColor = lerpColor(
    arrowColor,
    color(0),
    0.55f
  );

  int lightColor = lerpColor(
    arrowColor,
    color(255),
    0.38f
  );

  // always orient the arrow to the right in local coordinates

  translate(
    startX,
    startY
  );

  rotate(
    angle
  );

  // arrowhead size

  float headLength = max(
    12.0f,
    t * 4.2f
  );

  float headHalfHeight = max(
    6.0f,
    t * 2.0f
  );


  // automatically reduce arrowhead size for short arrows
  if (headLength > arrowLength * 0.50f) {

    headLength =
      arrowLength * 0.50f;

    headHalfHeight =
      headLength * 0.48f;
  }


  float headStart =
    arrowLength - headLength;


  float shaftEnd =
    headStart + t * 0.8f;

  // 1. DARK SHAFT SHADOW

  strokeCap(ROUND);
  strokeJoin(ROUND);

  stroke(
    darkColor
  );

  strokeWeight(
    t + 3.0f
  );

  line(
    0,
    1.5f,
    shaftEnd,
    1.5f
  );

  // 2. DARK ARROWHEAD SHADOW

  noStroke();

  fill(
    darkColor
  );

  beginShape();

  // tip
  vertex(
    arrowLength + 1.5f,
    1.5f
  );

  // upper rear corner
  vertex(
    headStart - 1.5f,
    -headHalfHeight - 1.5f
  );

  // notch
  vertex(
    headStart + t * 0.55f,
    1.5f
  );

  // lower rear corner
  vertex(
    headStart - 1.5f,
    headHalfHeight + 4.0f
  );

  endShape(CLOSE);

  // 3. MAIN SHAFT

  stroke(
    mainColor
  );

  strokeWeight(
    t
  );

  strokeCap(ROUND);

  line(
    0,
    0,
    shaftEnd,
    0
  );

  // 4. SHARP ARROWHEAD

  noStroke();

  fill(
    mainColor
  );

  beginShape();

  // exact endpoint
  vertex(
    arrowLength,
    0
  );

  // upper corner
  vertex(
    headStart,
    -headHalfHeight
  );

  // inner notch
  vertex(
    headStart + t * 0.65f,
    0
  );

  // lower corner
  vertex(
    headStart,
    headHalfHeight
  );

  endShape(CLOSE);

  // 5. SHAFT HIGHLIGHT

  stroke(
    lightColor,
    120
  );

  strokeWeight(
    max(
      1.0f,
      t * 0.25f
    )
  );

  strokeCap(ROUND);


  float highlightStart = min(
    t * 1.5f,
    shaftEnd
  );

  float highlightEnd = max(
    highlightStart,
    shaftEnd - t
  );


  if (highlightEnd > highlightStart) {

    line(
      highlightStart,
      -t * 0.22f,

      highlightEnd,
      -t * 0.22f
    );
  }

  // 6. ARROWHEAD HIGHLIGHT

  stroke(
    lightColor,
    95
  );

  strokeWeight(
    max(
      0.8f,
      t * 0.20f
    )
  );

  strokeCap(ROUND);


  line(
    headStart + t,
    -headHalfHeight + t * 0.55f,

    arrowLength - t * 1.2f,
    -t * 0.35f
  );


  popStyle();
  popMatrix();
}

void draw_CheckArrow(
  double x,
  double y,
  double size
) {

  if (size <= 0) {
    return;
  }

  pushMatrix();
  pushStyle();

  translate(
    (float)x,
    (float)y
  );

  scale(
    (float)size
  );


  final int CHECK_GREEN =
    #35FF4A;

  final int CHECK_DARK_GREEN =
    #087F18;

  final int CHECK_LIGHT_GREEN =
    #A0FFAA;


  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();

  // DARK UNDERLYING OUTLINE
  
  stroke(
    CHECK_DARK_GREEN
  );

  strokeWeight(8);

  line(
    -14 + 1.5,
    0  + 1.5,

    -4  + 1.5,
    10 + 1.5
  );

  line(
    -4  + 1.5,
    10 + 1.5,

    17  + 1.5,
    -13 + 1.5
  );

  // MAIN GREEN CHECK MARK

  stroke(
    CHECK_GREEN
  );

  strokeWeight(5.5);

  line(
    -14,
    0,

    -4,
    10
  );

  line(
    -4,
    10,

    17,
    -13
  );

  // SUBTLE HIGHLIGHT

  stroke(
    CHECK_LIGHT_GREEN,
    150
  );

  strokeWeight(1.2);

  line(
    -12,
    -1.2,

    -4,
    6.8
  );

  line(
    -2,
    6.5,

    14,
    -11
  );


  popStyle();
  popMatrix();
}

}


  
