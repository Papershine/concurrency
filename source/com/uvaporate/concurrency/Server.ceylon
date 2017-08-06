import com.uvaporate.concurrency.dispatch {
	Dispatch
}
import java.util {
	HashMap
}

shared abstract class Server() {
	HashMap<Integer, Client> subscribers = HashMap<Integer, Client>();
	
	"Send a message to this server."
	since("0.1.0")
	by("Hilary Lau")
	shared void sendMessage(String msg, Integer msgId, Client sender) {
		this.checkForKeyAndClean(msgId);
		this.placeKeyAndValue(msgId, sender);
		Dispatch.run(() => reactToMessage(msg, msgId));
	}
	"Send an `Object` to this server."
	since("0.1.0")
	by("Hilary Lau")
	shared void sendObject(Object obj, Integer msgId, Client sender) {
		this.checkForKeyAndClean(msgId);
		this.placeKeyAndValue(msgId, sender);
		Dispatch.run(() => reactToObject(obj, msgId));
	}
	
	void checkForKeyAndClean(Integer key) {
		if (subscribers.containsKey(key)) {
			this.subscribers.remove(key);
		}
	}
	
	void placeKeyAndValue(Integer key, Client val) {
		this.subscribers.put(key, val);
	}
	
	"Implement this method to respond to messages sent by a `Client`"
	since("0.1.0")
	by("Hilary Lau")
	shared formal void reactToMessage(String msg, Integer msgId);
	"Implement this method to respond to objects sent by a `Client`"
	since("0.1.0")
	shared formal void reactToObject(Object obj, Integer msgIdr);
	
	"Send a message to the client."
	since("0.1.0")
	by("Hilary Lau")
	shared void sendMessageToSender(String msg, Integer msgId) {
		Client client = subscribers.get(msgId);
		client.receiveTextMessage(msg, msgId, this);
	}
	"Send an `Object` to the client."
	since("0.1.0")
	by("Hilary Lau")
	shared void sendObjectToSender(Object obj, Integer msgId) {
		Client client = subscribers.get(msgId);
		client.receiveObject(obj, msgId, this);
	}
}