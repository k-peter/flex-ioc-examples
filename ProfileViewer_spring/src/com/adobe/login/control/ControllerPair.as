package com.adobe.login.control
{
	import com.adobe.login.control.handler.Handler;
	
	import flash.events.EventDispatcher;
	
	public class ControllerPair
	{
		public var dispatcher : EventDispatcher;
		public var handler : Handler;
		
		public function addListeners() : void
		{
			dispatcher.addEventListener( handler.eventId, handler.execute );
		}
	}
}