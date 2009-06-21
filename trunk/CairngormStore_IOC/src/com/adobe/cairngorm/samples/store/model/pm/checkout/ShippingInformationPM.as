package com.adobe.cairngorm.samples.store.model.pm.checkout
{
	import com.adobe.cairngorm.samples.store.event.NewScreenEvent;
	import com.adobe.cairngorm.samples.store.model.domain.DeliverableItem;
	import com.adobe.cairngorm.samples.store.model.pm.navigation.BaseShowable;
	
	[InjectConstructor]
	public class ShippingInformationPM extends BaseShowable
	{
		private static const NEXT_POSITION : int = 2;
		
		[Bindable]
		public var shippingModel : XML = ShippingXML.DATA;
		
		[Inject]
		[Bindable]
		public var pm : ShippingInformationPM;
		
		private var _deliverable : DeliverableItem;
		
   			
		public function updateShippingOptions( cost : Number ) : void
		{
			deliverable.shippingCost = cost;  
		}   
		
		override public function get canShow() : Boolean
   		{
   			return true;
   		}
   		
   		override public function get canHide() : Boolean
   		{
   			return true;
   		}
   		
   		public function set deliverable( value : DeliverableItem ) : void
		{
			_deliverable = value;
			var shippingCost : Number = parseFloat( shippingModel.company[ shippingModel.company.length - 1 ].rate );
			updateShippingOptions( shippingCost );   	
		}
		
		[Inject]
		public function get deliverable() : DeliverableItem
		{
			return _deliverable;
		}
		

	}
}

class ShippingXML
{
	public static const DATA : XML = <shipping>
    <company name="US Mail (3-7 business days)" rate="5.99"/>
    <company name="UPS (2 business days)" rate="12.99"/>
    <company name="FedEx (Overnight Priority)" rate="18.99"/>
</shipping>;
}