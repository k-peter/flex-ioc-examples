package com.adobe.samplestore.event
{
	import flash.events.Event;

	public class FilterProductsEvent extends Event
	{
		public static var EVENT_FILTER_PRODUCTS : String = "filterProducts";

		public var filterOn : String;
  		public var min : uint;
      public var max : uint;
		
      public function FilterProductsEvent()
      {
      	super( EVENT_FILTER_PRODUCTS );
      }
     	
		override public function clone() : Event
		{
			return new FilterProductsEvent();
		}		
	}
	
}