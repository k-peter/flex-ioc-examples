
package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;	

	public class CompletePurchaseCommand implements ICommand
	{
		public var orderConfirmed : Boolean;
		
		public function CompletePurchaseCommand()
		{
		}
		
		public function execute( event : CairngormEvent ) : void
		{
			var purchaseEvent : PurchaseCompleteEvent =
				PurchaseCompleteEvent( event );
			
	   		var generalInformation : GeneralInformationModel = purchaseEvent.generalInformation;
			var paymentInformation : PaymentInformationModel = purchaseEvent.paymentInformation;
			var shoppingCart : ShoppingCart = purchaseEvent.shoppingCart;
		   	
			orderConfirmed = true;
		}
	
	}

}