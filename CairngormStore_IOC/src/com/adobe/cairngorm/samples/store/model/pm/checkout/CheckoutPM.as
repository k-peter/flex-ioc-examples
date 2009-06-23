package com.adobe.cairngorm.samples.store.model.pm.checkout
{
	import com.adobe.ac.navigation.IShowable;
	import com.adobe.cairngorm.samples.store.event.NavigateEvent;
	import com.adobe.cairngorm.samples.store.model.domain.shoppingcart.ShoppingCart;
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseNavigator;
	
	import mx.formatters.CurrencyFormatter;


	public class CheckoutPM extends BaseNavigator implements IShowable
	{
		[Inject]
		[Bindable]
		public var shoppingCart : ShoppingCart;
	
		[Inject]
		[Bindable]
		public var currencyFormatter : CurrencyFormatter;
		
		public function get canShow() : Boolean
		{
			return true;
		}

		public function get canHide() : Boolean
		{
			return true;
		}
		
		public function get name() : String 
		{
			return NavigateEvent.CHECKOUT;
		}
	}
}