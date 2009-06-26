package com.adobe.samplestore.business
{
	import mx.rpc.IResponder;
	
	public interface IDelegate
	{
		function addResponder( responder : IResponder ) : void;
	}
}