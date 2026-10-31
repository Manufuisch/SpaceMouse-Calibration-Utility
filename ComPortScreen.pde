
/*
Class ComPortScreen:

Responsible for:

- drawing the static ComPortScreen Sequenz Menu


It only draws the parts of the manue, 
that must be drawn one time and doesn´t change the whole Sequenze.
*/

class ComPortScreen {
   
   private final drawText draw_Text = new drawText();
  
   public void draw_ComPortScreen(){
   
   background(BLACK);  
     
   pushStyle();
     
   stroke(RED);
   strokeWeight(2);
   
   
   fill(BLACK);
   rect(203,177,600,400,20,20,20,20);
   pushStyle();
   
   fill(RED);
   line(203,251,803,251);
   
   popStyle();
   
   
    draw_Text.draw_Text(
    "Choose COM-Port",
    213,
    215,
    54,
    #FF2323,
    LEFT,
    CENTER
  );
}
}
/*
Class ComPortScreen_Variable:

Responsible for:

- listing the different COM ports
- updateing the list every loop so that new pluged in device are getting shown
- automatically arranges the ComPort names in the menue depending on available spots on the screen
- stores the respective coordinates of the ComPort names for subsequent classes
*/

 class ComPortScreen_Variable{
   
 public float[] CoordinatesBuffer;
 
 public boolean BufferisStoraged = false;
  
 private final int MaxPrintableComPorts = 41;
  
 private int tolerances = 4; // reserved places in the ComPortList that can be taken by new ComPorts during the Sequenz
 
 private int PlacesforComPorts = 0; 
 
 // Array gets initialised bassed on the amount of current connected ComPorts
 ComPortScreen_Variable(String[] ComPortList){
   CoordinatesBuffer = new float[(ComPortList.length + tolerances) * 5];
 }
 /* 
 Function draw_ComPorts:
 
 - arranges and draws the given PortNames in the ComPort list screen, and paints one of the given Port names in the specified color
 - transfers the coordinate to the StorageComPortCoordinate Function
 */
 public void draw_ComPorts(String[] ComPortList, color ColourComPort, int PaintedComPort){
    
    Background(BLACK);
   
    float TextHight = 32;   
    float MaxWidthText =0;
    final float DistanceBetweenComPortsYAxe = 20 + (TextHight/2);
    final float DistanceBetweenComPortsXAxe = 50;
    
    float MaxComPortsXAxe = 7;
    int CounterPixelYAxe = 251;
    float CounterPixelXAxe = 213;
    
    PlacesforComPorts =0;

   for(int i =0; i < ComPortList.length && ComPortList.length <=  MaxPrintableComPorts; i++){
    
   // colour of all Painted Com Ports
   color Colour = RED;  
     
   if( i == PaintedComPort)Colour = ColourComPort; 
     
   textSize(TextHight);
     
   if(MaxWidthText < textWidth(ComPortList[i])){MaxWidthText = textWidth(ComPortList[i]);}
   
   if(i >=  MaxComPortsXAxe){
   CounterPixelYAxe  = 251 ;
   MaxComPortsXAxe  += MaxComPortsXAxe ;
   CounterPixelXAxe += MaxWidthText+ DistanceBetweenComPortsXAxe ;
   }
   
   CounterPixelYAxe += DistanceBetweenComPortsYAxe;
   // storage the data in an array
   StorageComPortCoordinate(i,CounterPixelXAxe,CounterPixelYAxe,TextHight, textWidth(ComPortList[i]));  
   // the ComPort is drawn with the current calculated data coordinates
   draw_Text.draw_Text(ComPortList[i],CounterPixelXAxe,CounterPixelYAxe,TextHight,Colour,LEFT,TOP);
   
 }
 }
 /*
 Function StorageComPortCoordinate:
 
 - stores the coordinates given to it in a certain order in an array for later functions
 
 */
  private void StorageComPortCoordinate(int ComPortNumber, float ComPortXStart, float ComPortYStart, float ComPortHeight, float ComPortWidth){     
    
          CoordinatesBuffer[ PlacesforComPorts ] = ComPortNumber;
          PlacesforComPorts++;
          
          CoordinatesBuffer[ PlacesforComPorts ] = ComPortXStart;
          PlacesforComPorts++;
   
          CoordinatesBuffer[ PlacesforComPorts ] = ComPortYStart;
          PlacesforComPorts++;
          
          CoordinatesBuffer[ PlacesforComPorts ] = ComPortHeight;
          PlacesforComPorts++;
          
          CoordinatesBuffer[ PlacesforComPorts ] = ComPortWidth;
          PlacesforComPorts++;

 }
 
/*
Function Background:

 - draws a black square over the previous variable parts of the ComPort list, before each new drawing of the variable numbers
 
*/
 private void Background(color BackgroundColor){
 
 pushStyle();
 
 noStroke();
 
 fill(BackgroundColor);
 
 rect(207,254,593,320,0,0,20,20);
 
 popStyle();
 
 }
  
}
