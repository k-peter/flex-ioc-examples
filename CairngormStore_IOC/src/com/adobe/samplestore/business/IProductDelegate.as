package com.adobe.samplestore.business
{
	import mx.rpc.IResponder;
	
	public interface IProductDelegate extends IDelegate
	{
		function getProducts() : void;		
	}
}