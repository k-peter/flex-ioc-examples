package com.adobe.login.control.handler
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	import com.adobe.login.control.event.LoginEvent;
	import com.adobe.login.control.event.LoginResultEvent;
	import com.adobe.login.service.LoginDelegate;
	
	import mx.rpc.IResponder;
	
	import org.spicefactory.parsley.messaging.MessageRouter;
	
	
	public class LoginAction implements IResponder
	{
		[Inject]
		public var user : User;
		[Inject]
		public var friends : Friends;
		[Inject]
		public var client : AuthenticationClient;
		[Inject]
		public var delegate : LoginDelegate;
		
		public function get eventId() : String
		{
			return LoginEvent.LOGIN;
		}
		
		[MessageHandler]
		public function execute( event : LoginEvent ) : void
		{
			delegate.responder = this;
			delegate.authenticate( event.username, event.password );
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