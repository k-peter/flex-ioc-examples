package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class CompletePurchaseEvent extends Event
	{
		public static var EVENT_COMPLETE_PURCHASE : String = "completePurchase";

		public function CompletePurchaseEvent()
		{
			super( EVENT_COMPLETE_PURCHASE, true );
		}
     	
	}
	
}