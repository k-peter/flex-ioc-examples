package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.event.ValidateCreditCardEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	
	import mx.collections.ArrayCollection;
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;		
	
	public class ValidateOrderCommand extends SequenceCommand
	{
	   public var shoppingCart : ShoppingCart;
	   public var formIncomplete : Boolean;
	   public var paymentInfo : PaymentInformationModel;
	   public var generalInfoValidators : ArrayCollection;
	   public var paymentValidators : ArrayCollection;
	   
	 	public override function execute( event : CairngormEvent ) : void
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
		
		public override function executeNextCommand() : void
		{
			// Create the "next" event.
			var cardDetails : PaymentInformationModel = paymentInfo;
				
			var cardEvent : ValidateCreditCardEvent = new ValidateCreditCardEvent();
			cardEvent.cardholderName = cardDetails.cardHolder;
			cardEvent.cardNumber = cardDetails.cardNumber;
			
			// Dispatch the event.
			nextEvent = cardEvent;
			
			super.executeNextCommand();
			
			// Clear the event.
			nextEvent = null;
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
			
	}
}