package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;

	public class PlaceOrderEvent extends Event
	{
		public static const PLACE_ORDER : String = "placeOrder";
		
		public function PlaceOrderEvent()
		{
			super( PLACE_ORDER );
		}
		
	}
}