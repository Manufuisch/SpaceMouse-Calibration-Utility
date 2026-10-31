
/*
Class StateMachineStaticText:

Responsible for:

- selecting the respective static sequence based on the current inputs

Sequenz1 == Hall Joystick Function Test
Sequenz2 == Mechanical Centering
Sequenz3 == Min/ Max Calibration

*/
class  StateMachineStaticText {
  
    private final Sequenz3 draw_StaticSequenz3 = new Sequenz3();
     private final Sequenz2 draw_StaticSequenz2 = new Sequenz2();
      private final Sequenz1 draw_StaticSequenz1 = new Sequenz1();
       private final ComPortScreen draw_StaticComPortSequenz = new ComPortScreen();
  
  private boolean ShowStyleEnable = false;
  /*
  Konstructorfunction StateMachineStaticText
  
  - draws the sequenz with which the programm should be started
  - only in this function it is possible to initialize the ShowStyle (== DeveloperMode!)
  */
  StateMachineStaticText (Sequenzes Startsequenzes,boolean ShowStyle) {
  
  ShowStyleEnable = ShowStyle;
    
  draw_Sequenz( Startsequenzes); 
  
  }
/*
Function draw_Sequenz:

- allows access to the main function to write sequences but does not have access to change the ShowStyle
*/
public void draw_Sequenz ( Sequenzes sequenzes){
  draw_sequenz(sequenzes,ShowStyleEnable); 
}

/*
Function draw_sequenz:

- StateMachine which chooses the the needed Sequenz and draws it
*/
  private void draw_sequenz (Sequenzes drawSequenz, boolean ShowStyle){
    
     
    switch (drawSequenz) {
      case ComPortSequenz:
      draw_StaticComPortSequenz.draw_ComPortScreen();
      
      break;
      
      case Sequenz1:
      
      draw_StaticSequenz1.draw_Sequenz1(ShowStyle);
      break;
      
      case Sequenz2:

      draw_StaticSequenz2.draw_Sequenz2(ShowStyle);
      break;
      
      case Sequenz3:

      draw_StaticSequenz3.draw_Sequenz3(ShowStyle);
      break;
      
    };
  } 
}
/*
Class UpdateSequenzes:

Responsible for:

- updating the variable sequences with overloaded functions to make the code look cleaner
*/
class UpdateSequenzes {
  
private final Sequenz3_Variable draw_VariableSequenz3 = new Sequenz3_Variable();
 private final Sequenz2_Variable draw_VariableSequenz2 = new Sequenz2_Variable();
  private final Sequenz1_Variable draw_VariableSequenz1 = new Sequenz1_Variable();
  
  //Sequenz 1 
  public void updateSequenz (Sequenzes UpdateSequenz, int[] getValues, String Selected_Joystick){if (UpdateSequenz.equals(Sequenzes.Sequenz1)) draw_VariableSequenz1.draw_VariableNumbers(getValues, Selected_Joystick);}
  
  //Sequenz 2
  public void updateSequenz (Sequenzes UpdateSequenz, int[] getValues, String Selected_Joystick, color ColourRectangularX, color ColourRectangularY){if (UpdateSequenz.equals(Sequenzes.Sequenz2)) draw_VariableSequenz2.draw_VariableNumbers(getValues, Selected_Joystick, ColourRectangularX, ColourRectangularY);}
  
  //Sequenz 3
  public void updateSequenz (Sequenzes UpdateSequenz,int[] getHIGHESTValues, int[]getLowestValues, String Selected_Joystick){if (UpdateSequenz.equals(Sequenzes.Sequenz3)) draw_VariableSequenz3.draw_VariableNumbers(getHIGHESTValues, getLowestValues, Selected_Joystick);}
  
  
}
