package com.adobe.samplestore.model.pm.productchooser
{
	import com.adobe.samplestore.event.NavigateEvent;
	import com.adobe.samplestore.model.domain.Products;
	import com.adobe.samplestore.model.domain.shoppingcart.ShoppingCart;
	import com.adobe.samplestore.model.pm.navigation.BaseShowable;

	public class GraphicalProductListPM extends BaseShowable
	{
		[Inject]
		[Bindable]
		public var products : Products;
		
		[Inject]
		[Bindable]
		public var shoppingCart : ShoppingCart;
			
		
		public function updateSelectedProduct( event : Object ) : void 
		{
			products.selectedItem = event.target.selectedItem;
		}
		
		override public function get name() : String
		{
			return NavigateEvent.PRODUCTS_GRID;
		}
		
	}
}