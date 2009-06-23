package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.FilterProductsEvent;
	import com.adobe.cairngorm.samples.store.util.Comparator;
	
	public class FilterProductsAction
	{
		[Inject]
		public var productComparator : Comparator;
		
		[MessageHandler]
		public function execute( filterEvent : FilterProductsEvent ) : void
	   	{
	      	var filterOn : String = filterEvent.filterOn;
	      	var min : Number = filterEvent.min;
	      	var max : Number = filterEvent.max;
	
	      	productComparator.addFilterRangeProperty( filterOn, min, max );
	      	productComparator.filter();
	      	productComparator.applyAlphaEffect();
	   	}
	}
}