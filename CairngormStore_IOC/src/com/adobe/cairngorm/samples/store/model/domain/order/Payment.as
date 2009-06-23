package com.adobe.cairngorm.samples.store.model.domain.order
{
	[Bindable]
	public class Payment
	{
		public var cardType : String;
		public var cardNumber : String;
		public var cardHolder : String;
		public var cardExpMonth : String;
		public var cardExpYear : String;    
		
		public var isValid : Boolean;  
	}
}