package com.adobe.ioc.parsley
{
	import flash.events.EventDispatcher;
	
	[Event(name="contextReadyEvent", type="com.adobe.ioc.parsley.ContextReadyEvent")]
	public class Notifier extends EventDispatcher
	{
		public function Notifier()
		{
		}
		
		public function dispatchReadyEvent() : void
		{
			dispatchEvent( new ContextReadyEvent() );
		}
	}
}