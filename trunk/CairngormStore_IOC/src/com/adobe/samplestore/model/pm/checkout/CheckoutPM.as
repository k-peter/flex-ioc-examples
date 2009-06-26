package com.adobe.samplestore.model.pm.checkout
{
	import com.adobe.ac.navigation.IShowable;
	import com.adobe.samplestore.event.NavigateEvent;
	import com.adobe.samplestore.model.domain.shoppingcart.ShoppingCart;
	import com.adobe.samplestore.model.pm.navigation.BaseNavigator;
	
	import mx.formatters.CurrencyFormatter;


	public class CheckoutPM extends BaseNavigator implements IShowable
	{
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