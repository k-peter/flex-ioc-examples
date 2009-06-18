package com.adobe.cairngorm.samples.store.model.pm
{
	import com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.model.State;
	import com.adobe.cairngorm.samples.store.vo.ProductVO;
	
	import flash.events.EventDispatcher;
	
	import mx.formatters.CurrencyFormatter;
	
	[Event(name="addProductToShoppingCart",type="com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent")]
	[Event(name="deleteProductFromShoppingCart",type="com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent")]
	[ManagedEvents("deleteProductFromShoppingCart,addProductToShoppingCart")]
	public class ShoppingCartPM extends EventDispatcher
	{
		[Inject]
		[Bindable]
		public var state : State;
		
		[Inject]
		[Bindable]
		public var shoppingCart : ShoppingCart;
		
		[Inject]
		[Bindable]
		public var currencyFormatter : CurrencyFormatter;
		
		public var selectedItem : ProductVO;
		
		
		public function addProductToShoppingCart( product : ProductVO ) : void 
		{
			var event : UpdateShoppingCartEvent 
				= new UpdateShoppingCartEvent( UpdateShoppingCartEvent.ADD );
					
			event.product = product;
			event.quantity = 1;
			
			dispatchEvent( event );
		}
			
		public function deleteProductFromShoppingCart() : void 
		{
			var event : UpdateShoppingCartEvent = 
				new UpdateShoppingCartEvent( UpdateShoppingCartEvent.DELETE );
			
			event.product = selectedItem;
			
			dispatchEvent( event );
		}
		
		public function checkoutClicked() : void
		{
			state.workflowState = State.VIEWING_CHECKOUT;
		}		
		
			
		public function formatString( value : String ) : String 
		{
			return currencyFormatter.format( value );
		}
		public function formatNumber( value : Number ) : String 
		{
			return currencyFormatter.format( value );
		}
		
		public function updateSelectedProduct( event : Object ) : void 
		{		
			selectedItem = event.target.selectedItem.element;
			//CairngormEventDispatcher.getInstance().dispatchEvent( new CairngormEvent( SELECT_EVENT ) );
		}		
		
	}
}