package com.adobe.cairngorm.samples.store.ioc.actions
{
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	
	public class CompletePurchaseAction
	{
		[MessageHandler]
		public function execute( purchaseEvent : PurchaseCompleteEvent ) : void
		{
	   		var generalInformation : GeneralInformationModel = purchaseEvent.generalInformation;
			var paymentInformation : PaymentInformationModel = purchaseEvent.paymentInformation;
			var shoppingCart : ShoppingCart = purchaseEvent.shoppingCart;
		   	
			orderConfirmed = true;
		}
	}
}