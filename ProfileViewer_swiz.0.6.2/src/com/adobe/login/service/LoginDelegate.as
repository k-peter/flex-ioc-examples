package com.adobe.login.service
{
	import com.adobe.login.service.mock.MockModelFactory;
	import com.adobe.util.logging.LogUtil;
	
	import mx.logging.ILogger;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	import org.swizframework.util.TestUtil;
	
	
	public class LoginDelegate
	{
		//only included for illustrative purposes
		//to show that swiz has configured it correctly.
		[Autowire]
		public var remoteObject : RemoteObject;
		
		private var log : ILogger = LogUtil.getLogger( this );
		
		public function authenticate( username : String, password : String ) : AsyncToken
		{
			var mockResult : * = { user : MockModelFactory.createUser( username ), 
														friends : MockModelFactory.createFriends() }
							
			return TestUtil.mockResult( mockResult );
		}
	}
}