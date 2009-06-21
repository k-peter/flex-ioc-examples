package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.CheckoutEvent;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.model.domain.OrderStatus;
	
	import flash.events.EventDispatcher;
	
	[Event(name="orderConfirmed",type="com.adobe.cairngorm.samples.store.event.CheckoutEvent")]
	[ManagedEvents("orderConfirmed")]
	public class CompletePurchaseAction extends EventDispatcher
	{
		//[Inject]
		//public var orderStatus : OrderStatus;
		
		[MessageHandler]
		public function execute( purchaseEvent : PurchaseCompleteEvent ) : void
		{
	   		//var generalInformation : GeneralInformationModel = purchaseEvent.generalInformation;
			//var paymentInformation : PaymentInformationModel = purchaseEvent.paymentInformation;
			//var shoppingCart : ShoppingCart = purchaseEvent.shoppingCart;
		   	
			//orderStatus.orderConfirmed = true;
			
			dispatchEvent( CheckoutEvent.newOrderConfirmedEvent() );
		}
	}
}