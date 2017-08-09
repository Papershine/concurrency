"""
   This module provides ways to execute conncurrent operations easily without meddling with the `Thread` class and `Runnable` interface from Java.
   
   # Executing concurrent code via `Dispatch`:
   ```ceylon
   	Dispatch.run(() => print("Hello world!"));
   ```
   
   # Executing concurrent code via `Client` and `Server`s:
   
   ```ceylon
   class Exec() satisfies Client {
   shared void exec() {
   MyServer s = MyServer();
   s.sendMessage("hi to server", 12345, this);
   }
   
   shared actual void receiveObject(Object obj, Integer msgId, Server sender) {
   // not implemented
   }
   
   shared actual void receiveTextMessage(String msg, Integer msgId, Server sender) {
   print(msg);
   }
   
   }
   
   class MyServer() extends Server() {
   
   shared actual void reactToMessage(String msg, Integer msgId) {
   this.sendMessageToSender("hi from server", 12345);
   }
   
   shared actual void reactToObject(Object obj, Integer msgIdr) {
   // not implemented
   }
   
   }
   ```
"""
native("jvm")
module herd.concurrency "0.1.0" {
	import java.base "8";
}
