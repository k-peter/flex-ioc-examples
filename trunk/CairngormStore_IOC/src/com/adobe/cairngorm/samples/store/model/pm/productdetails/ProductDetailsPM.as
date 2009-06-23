package com.adobe.cairngorm.samples.store.model.pm.productdetails
{
	import com.adobe.cairngorm.samples.store.model.domain.Products;
	import com.adobe.cairngorm.samples.store.model.domain.shoppingcart.IShoppingCart;
	import com.adobe.cairngorm.samples.store.vo.ProductVO;
	
	import mx.binding.utils.BindingUtils;
	import mx.formatters.CurrencyFormatter;
	
	[Event(name="addProductToShoppingCart",type="com.adobe.cairngorm.samples.store.event.UpdateShoppingCartEvent")]
	[ManagedEvents("addProductToShoppingCart")]
	[InjectConstructor]
	public class ProductDetailsPM
	{
		[Bindable]
		private var products : Products;
		
		[Bindable]
		public var selectedItem : ProductVO;
		
		[Bindable]
		public var quantity : Number = 1;
		
		[Inject]
		[Bindable]
		public var currencyFormatter : CurrencyFormatter;
		
		[Inject]
		public var shoppingCart : IShoppingCart;
		
		public function ProductDetailsPM( products : Products )
		{
			this.products = products;
			BindingUtils.bindProperty( this, "selectedItem", products, "selectedItem" );
		}
		
		public function addProductToShoppingCart () : void
		{
			shoppingCart.addElement( products.selectedItem, quantity );
		}	
		
		public function formatPrice( value : Number ) : String 
		{
			return currencyFormatter.format( value );
		}
		
	}
}