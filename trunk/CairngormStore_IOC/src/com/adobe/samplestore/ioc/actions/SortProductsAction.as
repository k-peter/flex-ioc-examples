package com.adobe.samplestore.ioc.actions
{
	import com.adobe.samplestore.event.SortProductsEvent;
	import com.adobe.samplestore.model.domain.Products;
	
	import mx.collections.Sort;
	import mx.collections.SortField;
	
	public class SortProductsAction
	{
		[Inject]
		public var productsHolder : Products;
		
		[MessageHandler]
		public function execute( sortEvent : SortProductsEvent ) : void
		{
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