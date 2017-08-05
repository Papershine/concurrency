import java.lang { Thread }

shared class Dispatch {
	"Runs a function concurrently."
	since("0.1.0")
	by("Hilary Lau")
	shared static void run(void func()) {
		HelperThread(func).start();
	}
	
	"UNIMPLENTED"
	shared new () {}
}

class HelperThread(void func()) extends Thread() {
	shared actual void run() {
		func();
	}
}