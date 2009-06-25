package com.adobe.cairngorm.samples.store.business
{
	import mx.rpc.IResponder;
	
	public interface IDelegate
	{
		function addResponder( responder : IResponder ) : void;
	}
}