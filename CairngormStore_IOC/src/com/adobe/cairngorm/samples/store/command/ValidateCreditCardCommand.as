
package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.business.CreditCardDelegateStub;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	
	import mx.rpc.IResponder;
	
	
	public class ValidateCreditCardCommand extends SequenceCommand implements IResponder
	{
			public var generalInfo : GeneralInformationModel;
			public var paymentInfo : PaymentInformationModel;
			public var shoppingCart : ShoppingCart;
			public var creditCardInvalid : Boolean;
	   
		public override function execute( event : CairngormEvent ) : void
   	{
			var delegate : CreditCardDelegateStub = new CreditCardDelegateStub( this );	   
   		var cardEvent : ValidateCreditCardEvent = ValidateCreditCardEvent( event );
	   
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
	
   		public override function executeNextCommand() : void
		{
			var purchaseEvent : PurchaseCompleteEvent = new PurchaseCompleteEvent();
	      			
      		purchaseEvent.generalInformation = generalInfo;
      		purchaseEvent.paymentInformation = paymentInfo;
	      	purchaseEvent.shoppingCart = shoppingCart;
		}
	}
}