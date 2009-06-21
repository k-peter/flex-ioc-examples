
package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.model.domain.OrderStatus;
	import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;	

	public class CompletePurchaseCommand implements ICommand
	{
		[Inject]
		public var orderStatus : OrderStatus;
		
		public function execute( event : CairngormEvent ) : void
		{
			var purchaseEvent : PurchaseCompleteEvent =
				PurchaseCompleteEvent( event );
			
	   		var generalInformation : GeneralInformationModel = purchaseEvent.generalInformation;
			var paymentInformation : PaymentInformationModel = purchaseEvent.paymentInformation;
			var shoppingCart : ShoppingCart = purchaseEvent.shoppingCart;
		   	
			orderStatus.orderConfirmed = true;
		}
	
	}

}