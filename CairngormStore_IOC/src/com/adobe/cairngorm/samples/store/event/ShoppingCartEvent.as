package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;
	
	public class ShoppingCartEvent extends Event
	{
		public function ShoppingCartEvent()
		{
			super( "cartChanged" );
		}

	}
}