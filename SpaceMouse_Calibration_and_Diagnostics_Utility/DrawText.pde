/*

Class drawText:

Responsible for:

- write texts clearly in the sketch 

*/
class drawText{

private PFont font = null;  
  
public void draw_Text(
  String txt,
  float x,
  float y,
  float fontSize,
  int col,
  int horizontalAlign,
  int verticalAlign
) {
  
  
  if (font == null) font = createFont("SansSerif", 64, true);
  
  pushStyle();

  fill(col);
  noStroke();

  textFont( font);
  textSize(fontSize);
  textAlign(horizontalAlign, verticalAlign);

  text(txt, x, y);

  popStyle();
}    
}
