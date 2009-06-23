package com.adobe.cairngorm.samples.store.model.domain.order
{
	[Bindable]
	public class Shipping
	{
		public var name : String;
		public var rate : Number;
		
		public function Shipping( name : String, rate : Number ) 
		{
			this.name = name;
			this.rate = rate;
		}
	}
}