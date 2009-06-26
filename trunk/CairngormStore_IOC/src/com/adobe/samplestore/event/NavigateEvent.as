package com.adobe.samplestore.event
{
	import flash.events.Event;

	public class NavigateEvent extends Event
	{
		public static const CHECKOUT : String = "checkout";
		public static const PRODUCTS_GRID : String = "productsGrid";
		public static const PRODUCTS_LIST : String = "productsList";
		
		public function NavigateEvent( type : String )
		{
			super(type );
		}
		
	}
}