package com.adobe.login.control.handler
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	import com.adobe.login.control.event.LoginEvent;
	import com.adobe.login.control.event.LoginResultEvent;
	import com.adobe.login.service.LoginDelegate;
	
	import flash.events.Event;
	
	import mx.rpc.IResponder;

	public class LoginHandler implements Handler,IResponder
	{
		public var client : AuthenticationClient;
		public var user : User;
		public var friends : Friends;
		public var delegate : LoginDelegate;
		
		public function get eventId() : String
		{
			return LoginEvent.LOGIN;
		}
		
		public function execute(event:Event):void
		{
			delegate.responder = this;
			var loginEvent : LoginEvent = LoginEvent( event );
			delegate.authenticate( loginEvent.username, loginEvent.password );
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