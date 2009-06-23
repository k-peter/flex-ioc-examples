package com.adobe.cairngorm.samples.store.view.messages
{
	import com.adobe.cairngorm.samples.store.event.CheckoutEvent;
	import com.adobe.cairngorm.samples.store.event.CompletePurchaseEvent;
	import com.adobe.cairngorm.samples.store.model.domain.shoppingcart.ShoppingCart;
	
	import flash.events.EventDispatcher;
	
	import mx.controls.Alert;

	public class MessageLauncher extends EventDispatcher
	{
		private static const INVALID_DATA : String = "Please enter valid data in the fields with errors and try again.";
		private static const PROBLEM : String = "Problem"; 
		private static const CREDITCARD_VALIDATION : String = "Credit Card Validation";
		private static const INVALID_CREDITCARD : String = "The credit card could not be validated, please try again.";
		private static const CONFIRMATION : String = "Confirmation";
		private static const CREDITCARD_VERIFIED : String = "Your credit card has been verified and your order has been placed. Thank you for your order.";
		private static const EMPTY_SHOPPING_CART : String = "You have no items in your shopping cart. Please select some items and proceed with your checkout.";
		
		[MessageHandler]
		public function confirmOrder( event : CompletePurchaseEvent ): void 
		{
			trace("purchasecomplete");
			Alert.show( CREDITCARD_VERIFIED, CONFIRMATION );		
		}
		
		[MessageHandler(selector="unauthorisedCreditCard")]
		public function informUserOfInvalidCreditCard( event : CheckoutEvent ) : void
		{
			Alert.show( INVALID_CREDITCARD, CREDITCARD_VALIDATION );	
		}
		
		/* [MessageHandler(selector="cartChanged")]
		public function informUserOfEmptyShoppingCart( value : ShoppingCartEvent ) : void
		{
			if( shoppingCart.cartEmpty )
			{
				Alert.show( EMPTY_SHOPPING_CART, PROBLEM );	
			}
		} */
		
		[MessageHandler(selector="incompleteForm")]
		public function informUserOfIncompleteForm( value : CheckoutEvent ): void
		{
			Alert.show( INVALID_DATA, PROBLEM );
		}	
	}
}