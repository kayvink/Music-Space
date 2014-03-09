import oscP5.*;
import netP5.*;
import java.util.Map;

OscP5 oscP5;
NetAddress myRemoteLocation;
HashMap<String, OscMessage> messages;

class MaxAddOn
{
  MaxAddOn()
  {
    oscP5 = new OscP5(this, 5001);
    myRemoteLocation = new NetAddress("127.0.0.1", 5001);
    messages  = new HashMap<String, OscMessage>();
  }

  void createMessage(String messageID)
  {
    messages.put(messageID, new OscMessage(messageID));
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
  
  void clearMessage(String messageID)
  {
    
  }

  void printMessageNames()
  {
    for (Map.Entry me: messages.entrySet())
    {
      println(me.getKey());
    }
  }
}

