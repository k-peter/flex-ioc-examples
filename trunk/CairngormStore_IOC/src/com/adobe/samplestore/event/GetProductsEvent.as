
package com.adobe.samplestore.event
{
	import flash.events.Event;

	public class GetProductsEvent extends Event
	{
		public static var EVENT_GET_PRODUCTS : String = "getProducts";

		public var position : int;
		
		public function GetProductsEvent()
		{
			super( EVENT_GET_PRODUCTS );
		}
     	
	}
	
}