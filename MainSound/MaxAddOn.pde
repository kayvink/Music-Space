import oscP5.*;
import netP5.*;
import java.util.Map;

OscP5 oscP5;
NetAddress myRemoteLocation;
HashMap<String, OscMessage> messages;
int messageSendCounter;
int messageReceiveCounter;
int num_sendPorts = 10;


class MaxAddOn
{
  MaxAddOn()
  {
    oscP5 = new OscP5(this, 5001);
    myRemoteLocation = new NetAddress("127.0.0.1", 5001);
    messages  = new HashMap<String, OscMessage>();
    messageSendCounter = 0;
    messageReceiveCounter = 0;
  }

  void createMessage(String messageID)
  {
    if (messageSendCounter == 0)
    {
      messages.put(messageID, new OscMessage(messageID));
      messageSendCounter++;
    } 
    else if (messageSendCounter < 10)
    {
      oscP5 = new OscP5(this, 5001 + messageSendCounter);
      myRemoteLocation = new NetAddress("127.0.0.1", 5001 + messageSendCounter);
      messages.put(messageID, new OscMessage(messageID));
      messageSendCounter++;
    } 
    else
    {
      messageSendCounter = 0;
      oscP5 = new OscP5(this, 5001 + messageSendCounter);
      myRemoteLocation = new NetAddress("127.0.0.1", 5001 + messageSendCounter);
      messages.put(messageID, new OscMessage(messageID));
      messageSendCounter++;
    }
  }

  void addStringMessage(String messageID, String message)
  {
    OscMessage toBeAdded = messages.get(messageID); 
    toBeAdded.add(message);
    oscP5.send(toBeAdded, myRemoteLocation);
  }

  void addFloatMessage(String messageID, int sendF)
  {
    OscMessage toBeAdded = messages.get(messageID); 
    toBeAdded.add(sendF);
    oscP5.send(toBeAdded, myRemoteLocation);
  }

  void addIntMessage(String messageID, int sendI)
  {
    OscMessage toBeAdded = messages.get(messageID); 
    toBeAdded.add(sendI);
    oscP5.send(toBeAdded, myRemoteLocation);
  }

  void printMessageNames()
  {
    for (Map.Entry me: messages.entrySet())
    {
      println(me.getKey());
    }
  }

  // listen ports from 5011 to 5020
  // trial
  void listen()
  {
 
  }
  
}
