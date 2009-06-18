package com.adobe.cairngorm.samples.store.event
{
	import flash.events.Event;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart; 
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;		

	public class PurchaseCompleteEvent extends CairngormEvent
	{
		public static var EVENT_COMPLETE_PURCHASE : String = "completePurchase";

		public var generalInformation : GeneralInformationModel;
      public var paymentInformation : PaymentInformationModel;
      public var shoppingCart : ShoppingCart;
		
		public function PurchaseCompleteEvent()
		{
			super( EVENT_COMPLETE_PURCHASE );
		}
     	
		override public function clone() : Event
		{
			return new PurchaseCompleteEvent();
		}			
	}
	
}