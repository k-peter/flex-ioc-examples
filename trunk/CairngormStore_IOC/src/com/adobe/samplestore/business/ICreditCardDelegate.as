package com.adobe.samplestore.business
{
	public interface ICreditCardDelegate extends IDelegate
	{
		function authoriseCreditCard( name : String, number : String ) : void;		
	}
}