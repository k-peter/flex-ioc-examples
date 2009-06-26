package com.adobe.samplestore.ioc.actions
{
	import com.adobe.samplestore.event.CheckoutEvent;
	import com.adobe.samplestore.event.CompletePurchaseEvent;
	
	import flash.events.EventDispatcher;
	
	[Event(name="orderConfirmed",type="com.adobe.samplestore.event.CheckoutEvent")]
	[ManagedEvents("orderConfirmed")]
	public class CompletePurchaseAction extends EventDispatcher
	{
		[MessageHandler]
		public function execute( purchaseEvent : CompletePurchaseEvent ) : void
		{
			//place your order here.. just dispatching an order confirmed event for now.
			dispatchEvent( CheckoutEvent.newOrderConfirmedEvent() );
		}
	}
}