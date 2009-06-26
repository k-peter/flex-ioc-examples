package com.adobe.samplestore.model.domain.order
{
	[Bindable]
	public class ShippingDetails
	{
		public var name : String;
		public var rate : Number;
		
		public function ShippingDetails( name : String, rate : Number ) 
		{
			this.name = name;
			this.rate = rate;
		}
	}
}