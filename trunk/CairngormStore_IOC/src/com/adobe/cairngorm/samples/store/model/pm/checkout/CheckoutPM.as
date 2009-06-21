package com.adobe.cairngorm.samples.store.model.pm.checkout
{
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseNavigator;
	
	import mx.collections.IList;
	import mx.formatters.CurrencyFormatter;


	public class CheckoutPM extends BaseNavigator
	{
		[Inject]
		[Bindable]
		public var shoppingCart : ShoppingCart;
	
		[Inject]
		[Bindable]
		public var currencyFormatter : CurrencyFormatter;
	}
}