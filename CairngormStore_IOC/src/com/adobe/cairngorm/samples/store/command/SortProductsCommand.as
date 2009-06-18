
package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.event.SortProductsEvent;
	import com.adobe.cairngorm.samples.store.model.Products;
	
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	public class SortProductsCommand implements ICommand
	{
	    
		public var productsHolder : Products;
	   
		public function execute( event : CairngormEvent ) : void
		{
			var sortEvent : SortProductsEvent = SortProductsEvent( event );
	    	var sortBy : String = sortEvent.sortBy;
	    	var sort : Sort = new Sort();
	      	
			 if ( sortBy == "price" )
			 {
			 	sort.fields = [ new SortField( sortBy, false, false, true ) ];     	
			 }
			 else
			 {
			 	sort.fields = [ new SortField( sortBy, true ) ];	
			 }
			  
			 productsHolder.products.sort = sort;
			 productsHolder.products.refresh();
			  
			 productsHolder.selectedItem = productsHolder.products[ 0 ];
	   	}
	}
}