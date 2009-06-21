package com.adobe.cairngorm.samples.store.model.domain
{
	[Bindable]
	public class OrderStatus
	{
	   public var orderConfirmed : Boolean;
	   public var creditCardInvalid : Boolean;
	   public var formIncomplete : Boolean;
	}
}