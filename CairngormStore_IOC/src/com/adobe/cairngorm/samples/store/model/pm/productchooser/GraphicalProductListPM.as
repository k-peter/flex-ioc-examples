package com.adobe.cairngorm.samples.store.model.pm.productchooser
{
	import com.adobe.cairngorm.samples.store.event.NavigateEvent;
	import com.adobe.cairngorm.samples.store.model.domain.Products;
	import com.adobe.cairngorm.samples.store.model.domain.shoppingcart.ShoppingCart;
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseShowable;

	public class GraphicalProductListPM extends BaseShowable
	{
	/* 	[Inject]
		[Bindable]
		public var products : Products; */
		
		private var _products : Products;
		
		public function set products( value : Products ) : void
		{
			_products = value;
		}
		[Inject]
		[Bindable]
		public function get products() : Products
		{
			return _products;
		}
		
		[Inject]
		[Bindable]
		public var shoppingCart : ShoppingCart;
			
		
		public function updateSelectedProduct( event : Object ) : void 
		{
			products.selectedItem = event.target.selectedItem;
			//dispatchEvent( new Event( SELECT_EVENT ) );
		}
		
		override public function get name() : String
		{
			return NavigateEvent.PRODUCTS_GRID;
		}
		
	}
}