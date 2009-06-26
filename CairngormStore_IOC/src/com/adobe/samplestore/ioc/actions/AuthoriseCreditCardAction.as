package com.adobe.samplestore.ioc.actions
{
	import com.adobe.samplestore.business.ICreditCardDelegate;
	import com.adobe.samplestore.event.CheckoutEvent;
	import com.adobe.samplestore.event.CompletePurchaseEvent;
	import com.adobe.samplestore.event.ValidateCreditCardEvent;
	import com.adobe.samplestore.model.domain.order.CustomerDetails;
	import com.adobe.samplestore.model.domain.order.PaymentDetails;
	import com.adobe.samplestore.model.domain.shoppingcart.ShoppingCart;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	
	[Event(name="completePurchase",type="com.adobe.samplestore.event.CompletePurchaseEvent")]
	[Event(name="unauthorisedCreditCard",type="com.adobe.samplestore.event.CheckoutEvent")]
	//Note to self: Blog about this syntax.. watch out for 
	//[ManagedEvents("completePurchase","unauthorisedCreditCard")]
	//[ManagedEvents("filterProducts,sortProducts")]
	[ManagedEvents("completePurchase,unauthorisedCreditCard")]
	public class AuthoriseCreditCardAction extends EventDispatcher implements IResponder
	{
		[Inject]
		public var generalInfo : CustomerDetails;
		[Inject]
		public var paymentInfo : PaymentDetails;
		[Inject]
		public var shoppingCart : ShoppingCart;
	
		[Inject]
		public var delegate : ICreditCardDelegate;
		
		[MessageHandler]
		public function execute( cardEvent : ValidateCreditCardEvent ) : void
		{
					
			var cardholderName : String = cardEvent.cardholderName;
			var cardNumber : String = cardEvent.cardNumber;
			delegate.addResponder( this );
			delegate.authoriseCreditCard( cardholderName, cardNumber );

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