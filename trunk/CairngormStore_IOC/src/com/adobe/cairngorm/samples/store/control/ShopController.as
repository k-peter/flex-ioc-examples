package com.adobe.cairngorm.samples.store.control
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.FrontController;
	import com.adobe.cairngorm.samples.store.command.*;
	import com.adobe.cairngorm.samples.store.event.FilterProductsEvent;
	import com.adobe.cairngorm.samples.store.event.GetProductsEvent;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.event.SortProductsEvent;
	import com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateOrderEvent;
	
	import org.spicefactory.parsley.flex.FlexContextBuilder;
	
	/**
	 * @version	$Revision: $
	 */
	public class ShopController extends FrontController
	{
		public function ShopController()
		{
			initialiseCommands();
		}
		
		public function initialiseCommands() : void
		{
			addCommand( GetProductsEvent.EVENT_GET_PRODUCTS, GetProductsCommand );	  
		  	addCommand( UpdateShoppingCartEvent.ADD, AddProductToShoppingCartCommand );
		 	addCommand( UpdateShoppingCartEvent.DELETE, DeleteProductFromShoppingCartCommand );	  
	      	addCommand( FilterProductsEvent.EVENT_FILTER_PRODUCTS, FilterProductsCommand );      	 
	      	addCommand( SortProductsEvent.EVENT_SORT_PRODUCTS, SortProductsCommand );      	 
	      	addCommand( ValidateOrderEvent.EVENT_VALIDATE_ORDER, ValidateOrderCommand );      	
	      	addCommand( ValidateCreditCardEvent.EVENT_VALIDATE_CREDIT_CARD, ValidateCreditCardCommand );      	   
	      	addCommand( PurchaseCompleteEvent.EVENT_COMPLETE_PURCHASE, CompletePurchaseCommand );
		}	
		
	}
	
}