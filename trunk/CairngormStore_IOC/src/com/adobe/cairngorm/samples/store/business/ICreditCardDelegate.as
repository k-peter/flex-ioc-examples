package com.adobe.cairngorm.samples.store.business
{
	public interface ICreditCardDelegate extends IDelegate
	{
		function authoriseCreditCard( name : String, number : String ) : void;		
	}
}