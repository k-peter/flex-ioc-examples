package com.adobe.samplestore.model.pm.productdetails
{
	import com.adobe.samplestore.model.domain.Products;
	import com.adobe.samplestore.model.domain.shoppingcart.IShoppingCart;
	import com.adobe.samplestore.vo.ProductVO;
	
	import mx.binding.utils.BindingUtils;
	import mx.formatters.CurrencyFormatter;
	
	[Event(name="addProductToShoppingCart",type="com.adobe.samplestore.event.UpdateShoppingCartEvent")]
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
		
		[Bindable]
		private var currencyFormatter : CurrencyFormatter;
		
		[Inject]
		public var shoppingCart : IShoppingCart;
		
		public function ProductDetailsPM( products : Products, formatter : CurrencyFormatter )
		{
			this.products = products;
			BindingUtils.bindProperty( this, "selectedItem", products, "selectedItem" );
			this.currencyFormatter = formatter;
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