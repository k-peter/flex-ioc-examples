package com.adobe.cairngorm.samples.store.model.domain.order
{
	import com.adobe.cairngorm.samples.store.model.domain.shoppingcart.ShoppingCart;
	
	[Bindable]
	public class Order
	{
		[Inject]
		public var payment : Payment;

		[Inject]
		public var general : General;
		
		[Inject]
		public var cart : ShoppingCart;		
		
		public function get isValid() : Boolean
		{
			return 	payment.isValid
					&&
					general.isValid
					&&
					cart.isValid;
			
		}
	}
}