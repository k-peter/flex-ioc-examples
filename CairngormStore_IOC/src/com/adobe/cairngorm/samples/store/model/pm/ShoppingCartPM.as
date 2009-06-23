package com.adobe.cairngorm.samples.store.model.pm
{
	import com.adobe.cairngorm.samples.store.event.NavigateEvent;
	import com.adobe.cairngorm.samples.store.model.domain.shoppingcart.ShoppingCart;
	import com.adobe.cairngorm.samples.store.vo.ProductVO;
	
	import flash.events.EventDispatcher;
	
	import mx.formatters.CurrencyFormatter;
	
	[Event(name="addProductToShoppingCart",type="com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent")]
	[Event(name="deleteProductFromShoppingCart",type="com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent")]
	[Event(name="checkout",type="com.adobe.cairngorm.samples.store.event.NavigateEvent")]
	[ManagedEvents("deleteProductFromShoppingCart,addProductToShoppingCart,checkout")]
	public class ShoppingCartPM extends EventDispatcher
	{
		
		[Inject]
		[Bindable]
		public var shoppingCart : ShoppingCart;
		
		[Inject]
		[Bindable]
		public var currencyFormatter : CurrencyFormatter;
		
		public var selectedItem : ProductVO;
		
		
		public function addProductToShoppingCart( product : ProductVO ) : void 
		{
			shoppingCart.addElement( product, 1 );
		}
			
		public function deleteProductFromShoppingCart() : void 
		{
			shoppingCart.deleteElement( selectedItem );
		}
		
		public function checkoutClicked() : void
		{
			dispatchEvent( new NavigateEvent( NavigateEvent.CHECKOUT ) );
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