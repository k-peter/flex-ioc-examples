package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;

	public class ValidateCreditCardEvent extends Event
	{
		public static const EVENT_VALIDATE_CREDIT_CARD : String = "validateCreditCard";

		public var cardholderName : String;
      	public var cardNumber : String;
		
		public function ValidateCreditCardEvent()
		{
			super( EVENT_VALIDATE_CREDIT_CARD, true );
		}
	}
}