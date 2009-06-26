package com.adobe.samplestore.model.pm.checkout
{
	import com.adobe.samplestore.model.domain.IDeliverableItem;
	import com.adobe.samplestore.model.domain.order.ShippingDetails;
	import com.adobe.samplestore.model.pm.navigation.BaseShowable;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	
	public class ShippingInformationPM extends BaseShowable
	{
		private static const NEXT_POSITION : int = 2;
		
		[Bindable]
		public var shippingModel : IList;
		
		private var _deliverable : IDeliverableItem;
		
		public function ShippingInformationPM()
		{
			var item1 : ShippingDetails = new ShippingDetails( "US Mail (3-7 business days)", 5.99 );
			var item2 : ShippingDetails = new ShippingDetails( "UPS (2 business days)", 12.99 );
    		var item3 : ShippingDetails = new ShippingDetails( "FedEx (Overnight Priority)", 18.99 );	
		
			shippingModel = new ArrayCollection( [item1, item2, item3] );
		}
   			
		public function updateShippingOptions( cost : Number ) : void
		{
			deliverable.shippingCost = cost;  
		}   
		
   		public function set deliverable( value : IDeliverableItem ) : void
		{
			_deliverable = value;
			var shippingCost : Number = parseFloat( shippingModel.getItemAt( shippingModel.length - 1 ).rate );
			updateShippingOptions( shippingCost );   	
		}
		
		[Inject]
		public function get deliverable() : IDeliverableItem
		{
			return _deliverable;
		}
		
		override public function get name() : String
		{
			return "SHIPPING_INFORMATION";
		}
		

	}
}
