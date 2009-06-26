package com.adobe.samplestore.model.domain.order
{
	import com.adobe.samplestore.model.domain.shoppingcart.ShoppingCart;
	
	[Bindable]
	public class Order
	{
		[Inject]
		public var payment : PaymentDetails;

		[Inject]
		public var general : CustomerDetails;
		
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