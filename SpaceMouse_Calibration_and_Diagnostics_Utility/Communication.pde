/*

Class Communicate:

Responsible for:

- communication with the MCU via Serial connection
- reading the transferred sensor data and storing it in an Buffer

*/
class Communicate { 

private Sequenzes lastSequenz;

/*
Konstructorfunction Communicate:

- starts the SeriellProtocoll with the MCU to open the function menue on the MCU an "." musst be written, after that the needed function can be opened

*/
Communicate(Sequenzes startSequenz){
String Letter = ".";

myPort.write(Letter + "\r\n");

switch(startSequenz){
  
case Sequenz1:
case Sequenz2:

Letter = "1";
break;

case Sequenz3:

Letter = "2";
break;

case ComPortSequenz:
// Placeholder
break;
};

myPort.write(Letter + "\r\n");

lastSequenz = startSequenz;
}

// Function receiveMassages ( read Massages and get them in an array in the right direction one array){  AX,   AY,   BX,   BY,   CX,   CY,   DX,   DY}

private int StartStoragePoint = 0;

private int XValue =0;

private int YValue =0;

private int[] ND = {0,0};//NOT DEFINED

private int[] Buffer = {0,0};

/*
Function SendMassage:

- gives the MCU the command to send the data needed for the sequence

*/
public void SendMassage(Sequenzes CurrentSequenz){

if(!lastSequenz.equals(CurrentSequenz)){
  
  String SendLetter = ".";
  
  switch(CurrentSequenz){
    
    case Sequenz1:
    
    case Sequenz2:
    
    StopSerialProtocoll();
    
    SendLetter = "1";
    break;
    
    case Sequenz3:
    
    StopSerialProtocoll();
    
    SendLetter = "2";
    break;
    
    case ComPortSequenz:
    // Placeholder
    break;
  };
  
  myPort.write(SendLetter+ "\r\n");
 
  myPort.clear(); // clears the data in the serial buffer
  
  lastSequenz = CurrentSequenz;
}
}
/*
Function StopSerialProtocol

- helper function for "SendMassage()" executes the stop and back in menu log

*/
private void StopSerialProtocoll(){
  
  myPort.write("Q\r\n");// stop sending
  
  myPort.write(".\r\n");// draw serial menue
}

/*
Function ReceiverMassage:

- reads the sended data
- uses the raw sensor strings trims and splits it into peaces
- filters the required sensor values from the array formats the strings as int and stores them in the buffer

*/
int[] ReceivedMassage(String SearchedLetter){

switch(SearchedLetter){
 case "A":
 StartStoragePoint =0;
 break;
 
 case "B":
 StartStoragePoint =4;
 break;
 
 case "C":
 StartStoragePoint =8;
 break;
 
 case "D":
 StartStoragePoint =12;
 break;
  
}

String RawValues = myPort.readStringUntil('\r');

if(RawValues == null ){return ND;}

RawValues = trim(RawValues);

// splits into min. 16 peaces if the massage was sended correctly
String[]  BufferRawValues = splitTokens(RawValues, " :");
  
if(BufferRawValues.length >=16){
  
YValue = int(BufferRawValues[StartStoragePoint + 3]);XValue = int(BufferRawValues[StartStoragePoint +1]);
  
Buffer[0] = XValue;
Buffer[1] = YValue;

return Buffer;
}
return ND;
}
}
