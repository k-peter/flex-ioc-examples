package com.adobe.samplestore.event
{
	import flash.events.Event;

	public class UpdateShippingCostEvent extends CairngormEvent
	{
		public static const SHIPPING_COST_CHANGE_EVENT : String = "updateShippingCost";

		public var cost : Number;
		
		public function UpdateShippingCostEvent()
		{
			super( SHIPPING_COST_CHANGE_EVENT );
		}
     	
		override public function clone() : Event
		{
			return new UpdateShippingCostEvent();
		}			
	}
	
}