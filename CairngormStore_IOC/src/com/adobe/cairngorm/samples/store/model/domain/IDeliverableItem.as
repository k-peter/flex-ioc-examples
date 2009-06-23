package com.adobe.cairngorm.samples.store.model.domain
{
	public interface IDeliverableItem
	{
		function get shippingCost() : Number;
		function set shippingCost( value : Number ) : void;
	}
}