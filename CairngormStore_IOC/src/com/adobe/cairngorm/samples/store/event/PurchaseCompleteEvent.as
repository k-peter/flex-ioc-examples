package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PurchaseCompleteEvent extends Event
	{
		public static var EVENT_COMPLETE_PURCHASE : String = "completePurchase";

		public function PurchaseCompleteEvent()
		{
			super( EVENT_COMPLETE_PURCHASE, true );
		}
     	
	}
	
}