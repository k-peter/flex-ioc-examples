package com.adobe.cairngorm.samples.store.model
{
	import com.adobe.cairngorm.samples.store.event.GetProductsEvent;
	import flash.events.EventDispatcher;
	
	[Event(name="getProducts",type="com.adobe.cairngorm.samples.store.event.GetProductsEvent")]
	[ManagedEvents("getProducts")]
	public class TestPM extends EventDispatcher
	{
		public function getProducts() : void
		{
			dispatchEvent( new GetProductsEvent() );
		}
	}
}