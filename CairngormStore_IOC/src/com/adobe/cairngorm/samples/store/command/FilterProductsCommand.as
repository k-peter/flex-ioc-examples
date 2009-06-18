
package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.event.FilterProductsEvent;
	import com.adobe.cairngorm.samples.store.util.Comparator;
	
	/**
	 * @version $Revision: $
	 */
	public class FilterProductsCommand implements ICommand
	{
		public var productComparator : Comparator;
	    
	 	public function FilterProductsCommand()
	   	{   
	   	}
	   
	  	public function execute( event : CairngormEvent ) : void
   	{
   	  	var filterEvent : FilterProductsEvent = FilterProductsEvent( event );
   	  
      	var filterOn : String = filterEvent.filterOn;
      	var min : Number = filterEvent.min;
      	var max : Number = filterEvent.max;

      	productComparator.addFilterRangeProperty( filterOn, min, max );
      	productComparator.filter();
      	productComparator.applyAlphaEffect();
   	}
	}

}