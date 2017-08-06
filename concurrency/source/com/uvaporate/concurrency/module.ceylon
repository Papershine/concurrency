"""
   This module provides ways to execute conncurrent operations easily without meddling with the `Thread` class and `Runnable` interface from Java.
   
   # Executing concurrent code via `Dispatch`:
   ```ceylon
   	Dispatch.run(() => print("Hello world!"));
   ```
"""
native("jvm")
module com.uvaporate.concurrency "0.1.0" {
	import java.base "8";
}
