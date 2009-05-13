package com.adobe.login.control.handler
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.domain.ModelLocator;
	import com.adobe.login.control.event.LoginEvent;
	import com.adobe.login.control.event.LoginResultEvent;
	import com.adobe.login.service.LoginDelegate;
	
	import flash.events.Event;
	
	import mx.rpc.IResponder;

	public class LoginHandler implements Handler,IResponder
	{
		public var client : AuthenticationClient;
		
		public function get eventId() : String
		{
			return LoginEvent.LOGIN;
		}
		
		public function execute(event:Event):void
		{
			var delegate : LoginDelegate = new LoginDelegate( this );
			trace("executed");
			var loginEvent : LoginEvent = LoginEvent( event );
			delegate.authenticate( loginEvent.username, loginEvent.password );
		}
		
		public function result(data:Object):void
		{
			var resultEvent : LoginResultEvent = LoginResultEvent( data );
			ModelLocator.getInstance().user = resultEvent.user;
			ModelLocator.getInstance().friends = resultEvent.friends;
			
			client.authenticated = true;
		}
	
		public function fault(info:Object):void
		{
			//not in use
		}
		
	}
}