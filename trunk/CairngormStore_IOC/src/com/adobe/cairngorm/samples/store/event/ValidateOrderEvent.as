package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;

	public class ValidateOrderEvent extends Event
	{
		public static var EVENT_VALIDATE_ORDER : String = "validateOrder";

		public var position : int;
		
		public function ValidateOrderEvent()
		{
			super( EVENT_VALIDATE_ORDER );
		}
     	
		override public function clone() : Event
		{
			return new ValidateOrderEvent();
		}	
	}
}