package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.business.CreditCardDelegateStub;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	
	import flash.events.EventDispatcher;
	
	import mx.rpc.IResponder;
	
	[Event(name="completePurchase",type="com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent")]
	[ManagedEvents("completePurchase")]
	public class ValidateCreditCardAction extends EventDispatcher implements IResponder
	{
		public var creditCardInvalid : Boolean;
		
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
		  	creditCardInvalid = false;
			
			if ( validationPassed )
			{				
			  	executeNextCommand();
			}
			else
			{		  	
			  	creditCardInvalid = true;
			}
		}
	
		public function fault( event : Object ) : void
		{
		}

		public function executeNextCommand() : void
		{
			var purchaseEvent : PurchaseCompleteEvent = new PurchaseCompleteEvent();
						
			purchaseEvent.generalInformation = generalInfo;
			purchaseEvent.paymentInformation = paymentInfo;
			purchaseEvent.shoppingCart = shoppingCart;
			
			dispatchEvent( purchaseEvent );
		}
	}

}