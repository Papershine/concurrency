# Concurrency for Ceylon

[![Slack](https://img.shields.io/badge/chat-on%20gitter-8be1f4.svg)](https://cloudvapor-dev.slack.com)
[![License](https://img.shields.io/badge/license-Apache2-yellowgreen.svg)](https://github.com/cloudvapour/concurrency/blob/master/LICENSE)
![Version](https://img.shields.io/badge/version-0.1.0-d87ded.svg)

There hasn't been good ways to do concurrent operations for Ceylon. However, using this library may help doing concurrent operations easier.

### Executing concurrent code via Dispatch:

```ceylon
  Dispatch.run(() => print("Hello world!"));
```

### Executing concurrent code via Client and Servers:

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

## Usage

Place this in your module descriptor (module.ceylon): 

```ceylon
import herd.concurrency "0.1.0";
```

The module will be automatically downloaded from Ceylon Herd.
