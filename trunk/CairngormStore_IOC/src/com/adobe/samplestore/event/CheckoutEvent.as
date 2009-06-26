package com.adobe.samplestore.event
{
	import flash.events.Event;
	
	public class CheckoutEvent extends Event
	{
		public static const ORDER_CONFIRMED : String = "orderConfirmed";
		public static const UNAUTHORISED_CREDITCARD : String = "unauthorisedCreditCard";
		public static const INCOMPLETE_FORM : String = "incompleteForm";
		
		public function CheckoutEvent( type : String )
		{
			super( type );
			
			switch( type )
			{
				case ORDER_CONFIRMED : break;
				case UNAUTHORISED_CREDITCARD : break;
				case INCOMPLETE_FORM : break;
				default : throw new Error( "Wrong type : " + type ); break;
			}
		}
		
		public static function newOrderConfirmedEvent() : CheckoutEvent
		{
			return new CheckoutEvent( ORDER_CONFIRMED );
		}
		
		public static function newUnathorisedCreditCardEvent() : CheckoutEvent
		{
			return new CheckoutEvent( UNAUTHORISED_CREDITCARD );
		}
		
		public static function newIncompleteFormEvent() : CheckoutEvent
		{
			return new CheckoutEvent( INCOMPLETE_FORM );
		}

	}
}