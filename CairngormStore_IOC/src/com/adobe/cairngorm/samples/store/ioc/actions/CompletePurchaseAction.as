package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.CheckoutEvent;
	import com.adobe.cairngorm.samples.store.event.CompletePurchaseEvent;
	import com.adobe.cairngorm.samples.store.model.domain.OrderStatus;
	
	import flash.events.EventDispatcher;
	
	[Event(name="orderConfirmed",type="com.adobe.cairngorm.samples.store.event.CheckoutEvent")]
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