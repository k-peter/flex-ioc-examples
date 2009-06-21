package com.adobe.cairngorm.samples.store.model.pm.checkout
{
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseShowable;
	import com.adobe.cairngorm.samples.store.view.checkout.PaymentInformationModel;
	
	import mx.collections.ArrayCollection;
	
	public class PaymentInformationPM extends BaseShowable
	{
		[Inject]
		[Bindable]
		public var pm : PaymentInformationPM;
		
		[Bindable]
		public var months : Array = [1,2,3,4,5,6,7,8,9,10,11,12];
	
		[Bindable]
		public var years : Array = [2009,2010,2011,2012,2013,2014];
	
		[Inject]
		[Bindable]
		public var paymentInformationModel : PaymentInformationModel;

		[Inject(id="paymentValidators")]
		[Bindable]
		public var paymentValidators : ArrayCollection;
		
		public function PaymentInformationPM()
		{
		}
		
		private function init() : void
		{
			//paymentValidators.addItem( cardHolderValidator );
		}
		
		override public function get canShow() : Boolean
   		{
   			return true;
   		}
   		
   		override public function get canHide() : Boolean
   		{
   			return true;
   		}

	}
}