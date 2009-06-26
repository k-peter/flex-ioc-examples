package com.adobe.samplestore.event
{
	import flash.events.Event;

	public class CompletePurchaseEvent extends Event
	{
		public static var EVENT_COMPLETE_PURCHASE : String = "completePurchase";

		public function CompletePurchaseEvent()
		{
			super( EVENT_COMPLETE_PURCHASE, true );
		}
     	
	}
	
}