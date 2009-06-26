package com.adobe.samplestore.ioc.actions
{
	import com.adobe.samplestore.event.FilterProductsEvent;
	import com.adobe.samplestore.util.Comparator;
	
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