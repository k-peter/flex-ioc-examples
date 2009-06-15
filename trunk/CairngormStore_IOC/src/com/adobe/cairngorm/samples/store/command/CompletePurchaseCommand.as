
package com.adobe.cairngorm.samples.store.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.samples.store.model.ShopModelLocator;
	import com.adobe.cairngorm.samples.store.event.PurchaseCompleteEvent;
	import com.adobe.cairngorm.samples.store.model.ShoppingCart;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
   import com.adobe.cairngorm.samples.store.view.checkout.GeneralInformationModel;	

	public class CompletePurchaseCommand implements ICommand
	{
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
		   	
		   	// In a real-world application, in here, we would let the back-end know
		   	// about a purchase.
			
			ShopModelLocator.getInstance().orderConfirmed = true;
		}
	
	}

}