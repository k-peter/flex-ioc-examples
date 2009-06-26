package com.adobe.samplestore.model.domain.order
{
	[Bindable]
	public class PaymentDetails
	{
		public var cardType : String;
		public var cardNumber : String;
		public var cardHolder : String;
		public var cardExpMonth : String;
		public var cardExpYear : String;    
		
		public var isValid : Boolean;  
	}
}