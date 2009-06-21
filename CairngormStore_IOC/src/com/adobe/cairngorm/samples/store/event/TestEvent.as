package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;

	public class TestEvent extends Event
	{
		public function TestEvent()
		{
			super("testEvent", bubbles, cancelable);
		}
		
	}
}