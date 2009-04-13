package com.adobe.login.service
{
	import com.adobe.login.control.event.LoginResultEvent;
	import com.adobe.login.service.mock.MockModelFactory;
	import com.adobe.util.logging.LogUtil;
	
	import mx.logging.ILogger;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;
	
	
	public class LoginDelegate
	{
		private static const LOGIN_DELEGATE : String  = "LOGIN_DELEGATE";
		
		public var responder : IResponder;
		
		public var remoteObject : RemoteObject;
		
		private var log : ILogger = LogUtil.getLogger( this );
		
		public function LoginDelegate( responder : IResponder = null ) 
		{
			remoteObject = getRemoteObject();
		
			log.info("remote object: " );
			log.info("destination: " + remoteObject.destination );
		
			this.responder = responder;
		}
		
		public function authenticate( username : String, password : String ) : void
		{
		
			if( username.indexOf( "invalidUsername" ) == -1 )
			{
				responder.result( 
						new LoginResultEvent( 
								MockModelFactory.createUser( username ), 
								MockModelFactory.createFriends()
								) 
							);
			}
		}
		
		private function getRemoteObject() : RemoteObject
		{
			var remoteObject : RemoteObject = new RemoteObject();
			remoteObject.destination = LOGIN_DELEGATE;
			return remoteObject;
		}
	}
}