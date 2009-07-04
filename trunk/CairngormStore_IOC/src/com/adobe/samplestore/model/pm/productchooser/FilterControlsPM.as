package com.adobe.samplestore.model.pm.productchooser
{
	import com.adobe.samplestore.event.FilterProductsEvent;
	import com.adobe.samplestore.event.SortProductsEvent;
	import com.adobe.samplestore.model.domain.Products;
	
	import flash.events.EventDispatcher;
	
	[Event(name="testEvent",type="com.adobe.samplestore.event.TestEvent")]
	[Event(name="filterProducts",type="com.adobe.samplestore.event.FilterProductsEvent")]
	[Event(name="sortProducts",type="com.adobe.samplestore.event.SortProductsEvent")]
	[ManagedEvents("filterProducts,sortProducts")]
	public class FilterControlsPM extends EventDispatcher
	{
		[Inject]
		[Bindable]
		public var productsHolder : Products;
		
		public function filterProductsByPrice( fromPrice : uint, toPrice : uint ) : void
		{
			var filterEvent : FilterProductsEvent = new FilterProductsEvent();
		  
		  	filterEvent.filterOn = "price";
			filterEvent.min = fromPrice;
			filterEvent.max = toPrice;
			
		  	dispatchEvent( filterEvent );
		}
		
		public function sortProducts( type : String ) : void
		{
			var sortEvent : SortProductsEvent = new SortProductsEvent();
			sortEvent.sortBy = type;
			dispatchEvent( sortEvent );
	  	}
		
		public function unselectProduct() : void
		{
			productsHolder.selectedItem = undefined;
		}	
	}
}