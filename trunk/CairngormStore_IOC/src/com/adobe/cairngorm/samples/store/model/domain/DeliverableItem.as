package com.adobe.cairngorm.samples.store.model.domain
{
	public interface DeliverableItem
	{
		function get shippingCost() : Number;
		function set shippingCost( value : Number ) : void;
	}
}