package com.adobe.cairngorm.samples.store.model.domain
{
	[Bindable]
	public class State
	{
		public static var VIEWING_PRODUCTS_IN_THUMBNAILS : Number = 0;
      	public static var VIEWING_PRODUCTS_IN_GRID : Number = 1;
      	public static var VIEWING_CHECKOUT : Number = 2;
	
		public var workflowState : int = VIEWING_PRODUCTS_IN_THUMBNAILS;
	}
}