shared interface Client {
	"Recieve a `String` message sent by a `Server`."
	since("0.1.0")
	by("Hilary Lau")
	shared formal void receiveTextMessage(String msg, Integer msgId, Server sender);
	"Recieve an `Object` sent by a `Server`."
	since("0.1.0")
	by("Hilary Lau")
	shared formal void receiveObject(Object obj, Integer msgId, Server sender);
}