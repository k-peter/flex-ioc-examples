package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateOrderEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;
	
	[Event(name="validateCreditCard",type="com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent")]
	[ManagedEvents("validateCreditCard")]
	public class ValidateOrderAction extends EventDispatcher
	{
		public var formIncomplete : Boolean;
		
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
					formIncomplete = true;
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

	}
}