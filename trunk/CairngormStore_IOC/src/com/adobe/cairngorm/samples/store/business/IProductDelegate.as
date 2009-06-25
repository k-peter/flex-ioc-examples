package com.adobe.cairngorm.samples.store.business
{
	import mx.rpc.IResponder;
	
	public interface IProductDelegate extends IDelegate
	{
		function getProducts() : void;		
	}
}