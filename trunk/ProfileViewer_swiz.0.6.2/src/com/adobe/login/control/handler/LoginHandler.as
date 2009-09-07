package com.adobe.login.control.handler
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	import com.adobe.login.control.event.LoginResultEvent;
	import com.adobe.login.service.LoginDelegate;
	import com.adobe.util.logging.LogUtil;
	
	import mx.rpc.IResponder;

	public class LoginHandler implements IResponder
	{
		[Autowire]
		public var client : AuthenticationClient;
		
		[Autowire]
		public var user : User;
		
		[Autowire]
		public var friends : Friends;
		
		[Autowire]
		public var delegate : LoginDelegate;
		
		[Mediate(event="LOGIN", properties="username,password")]
		public function login( username : String, password : String ) : void
		{
			LogUtil.getLogger( this ).info( "username: {0}, password {1} ", username, password );
			
			//For true asynchronous calls you can extend 
			//AbstractController here and get the delegate function to return an AsyncToken
			//Because this is a mock delegate we aren't returning it here
			
			//Note: mention command chaining feature also
			delegate.authenticate( username, password );
		}
		
		public function result(data:Object):void
		{
			var resultEvent : LoginResultEvent = LoginResultEvent( data );
			user.update( resultEvent.user );
			friends.update( resultEvent.friends );
			
			client.authenticated = true;
		}
	
		public function fault(info:Object):void
		{
			//not in use
		}
		
	}
}