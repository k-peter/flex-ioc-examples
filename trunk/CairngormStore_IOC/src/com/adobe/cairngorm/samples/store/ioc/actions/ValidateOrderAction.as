package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.CheckoutEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateOrderEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;
	
	[Event(name="validateCreditCard",type="com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent")]
	[Event(name="incompleteForm",type="com.adobe.cairngorm.samples.store.event.CheckoutEvent")]
	[ManagedEvents("validateCreditCard","incompleteForm")]
	public class ValidateOrderAction extends EventDispatcher
	{
		[Inject]
		public var shoppingCart : ShoppingCart;
		
		[Inject]
		public var cardDetails : PaymentInformationModel;
		
		[Inject(id="generalInfoValidators")]
		public var generalInfoValidators : ArrayCollection;
		
		[Inject(id="paymentValidators")]
		public var paymentValidators : ArrayCollection;
		
		[MessageHandler]
	 	public function execute( event : ValidateOrderEvent ) : void
		{
			if ( !shoppingCart.cartEmpty )
			{
				if ( validateCheckOutForm() )
				{
					executeNextCommand();
				}
				else
				{
					dispatchEvent( CheckoutEvent.newIncompleteFormEvent() );
				}
			}
		}
		
		public function validateCheckOutForm() : Boolean
		{
			var generalInfoValid : Boolean = validate( generalInfoValidators );
			var paymentInfoValid : Boolean = validate( paymentValidators );
			return generalInfoValid && paymentInfoValid;
		}
	
		private function validate( validators : ArrayCollection ) : Boolean
		{
			var valid : Boolean = true;
			
			for ( var i : uint = 0; i < validators.length; i++ )
			{
				var validator : Validator = Validator( validators[ i ] );
				var validationResult : ValidationResultEvent = validator.validate();
						
				if ( validationResult.type == ValidationResultEvent.INVALID )
				{
					valid = false;
					
					// We don't break so all the fields can validate.
				}
			}
			
			return valid;
		}	
		
		public function executeNextCommand() : void
		{
			var cardEvent : ValidateCreditCardEvent = new ValidateCreditCardEvent();
			cardEvent.cardholderName = cardDetails.cardHolder;
			cardEvent.cardNumber = cardDetails.cardNumber;
			dispatchEvent( cardEvent );
		}
		
		[MessageHandler]
		public function testFunction( event : ValidateCreditCardEvent ) : void
		{
			trace("ping handling event: " + event );
		}

	}
}