package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.business.CreditCardDelegateStub;
	import com.adobe.cairngorm.samples.store.event.CheckoutEvent;
	import com.adobe.cairngorm.samples.store.event.CompletePurchaseEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.model.domain.order.General;
	import com.adobe.cairngorm.samples.store.model.domain.order.Payment;
	import com.adobe.cairngorm.samples.store.model.domain.shoppingcart.ShoppingCart;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	
	[Event(name="completePurchase",type="com.adobe.cairngorm.samples.store.event.CompletePurchaseEvent")]
	[Event(name="unauthorisedCreditCard",type="com.adobe.cairngorm.samples.store.event.CheckoutEvent")]
	//Note to self: Blog about this syntax.. watch out for 
	//[ManagedEvents("completePurchase","unauthorisedCreditCard")]
	//[ManagedEvents("filterProducts,sortProducts")]
	[ManagedEvents("completePurchase,unauthorisedCreditCard")]
	public class AuthoriseCreditCardAction extends EventDispatcher implements IResponder
	{
		[Inject]
		public var generalInfo : General;
		[Inject]
		public var paymentInfo : Payment;
		[Inject]
		public var shoppingCart : ShoppingCart;
	
		[MessageHandler]
		public function execute( cardEvent : ValidateCreditCardEvent ) : void
		{
 			var delegate : CreditCardDelegateStub = new CreditCardDelegateStub( this );		
		
			var cardholderName : String = cardEvent.cardholderName;
			var cardNumber : String = cardEvent.cardNumber;
		
			delegate.validateCreditCard( cardholderName, cardNumber );

 		}	  
	
		public function result( event : Object ) : void
		{			
			var validationPassed : Boolean = ( event.result == true );
			
			if ( validationPassed )
			{				
			  	dispatchEvent( new CompletePurchaseEvent() );
			}
			else
			{		 
				dispatchEvent( CheckoutEvent.newUnathorisedCreditCardEvent() ); 	
			}
		}
	
		public function fault( event : Object ) : void
		{
		}

	}

}