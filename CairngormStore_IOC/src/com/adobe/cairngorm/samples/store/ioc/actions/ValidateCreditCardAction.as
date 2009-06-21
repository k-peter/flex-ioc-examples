package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.business.CreditCardDelegateStub;
	import com.adobe.cairngorm.samples.store.event.CheckoutEvent;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	
	import org.spicefactory.lib.reflect.types.Void;
	
	[Event(name="completePurchase",type="com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent")]
	[Event(name="invalidCreditCard",type="com.adobe.cairngorm.samples.store.event.CheckoutEvent")]
	//Note to self: Blog about this syntax.. watch out for 
	//[ManagedEvents("completePurchase","invalidCreditCard")]
	//[ManagedEvents("filterProducts,sortProducts")]
	[ManagedEvents("completePurchase,invalidCreditCard")]
	public class ValidateCreditCardAction extends EventDispatcher implements IResponder
	{
		[Inject]
		public var generalInfo : GeneralInformationModel;
		[Inject]
		public var paymentInfo : PaymentInformationModel;
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
				trace(">>>> valdidation passed");
			  	dispatchEvent( new PurchaseCompleteEvent() );
			}
			else
			{		 
				dispatchEvent( CheckoutEvent.newInvalidCreditCardEvent() ); 	
			}
		}
	
		public function fault( event : Object ) : void
		{
		}

	}

}