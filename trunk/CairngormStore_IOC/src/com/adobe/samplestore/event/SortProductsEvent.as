package com.adobe.samplestore.event
{
	import flash.events.Event;

	public class SortProductsEvent extends Event
	{
		public static var EVENT_SORT_PRODUCTS : String = "sortProducts";

		public var sortBy : String;
		
		public function SortProductsEvent()
		{
			super( EVENT_SORT_PRODUCTS );
		}
     	
		override public function clone() : Event
		{
			return new SortProductsEvent();
		}		
	}
	
}