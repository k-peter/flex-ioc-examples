package com.adobe.login.control.handler
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.ModelLocator;
	import com.adobe.dashboard.domain.User;
	import com.adobe.login.control.event.LoginEvent;
	import com.adobe.login.control.event.LoginResultEvent;
	import com.adobe.login.service.LoginDelegate;
	
	import mx.rpc.IResponder;
	
	import org.spicefactory.parsley.mvc.ApplicationEvent;
	public class LoginHandler implements Handler,IResponder
	{
		public var user : User;
		public var friends : Friends;

		public var client : AuthenticationClient;
		public var delegate : LoginDelegate;
		
		public function get eventId() : String
		{
			return LoginEvent.LOGIN_EVENT;
		}
		
		public function execute( event : ApplicationEvent ) : void
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