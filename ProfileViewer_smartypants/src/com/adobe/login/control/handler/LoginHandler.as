package com.adobe.login.control.handler
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	import com.adobe.login.control.event.LoginEvent;
	import com.adobe.login.control.event.LoginResultEvent;
	import com.adobe.login.service.LoginDelegate;
	
	import mx.rpc.IResponder;
	
	[Bindable]
	public class LoginHandler implements Handler,IResponder
	{
		public var user : User;
		public var friends : Friends;
		
		public var client : AuthenticationClient;
		
		private var _eventSource : EventDispatcher;
		private var _eventType : String;
		
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
			user.update( resultEvent.user );
			friends.update( resultEvent.friends );
			
			client.authenticated = true;
		}	
		
		public function fault(info:Object):void
		{
			//not in use
		}
		
		public function set eventSource( value : EventDispatcher ) : void 
		{
			_eventSource = value;
			initListener();
		}
		
		public function set eventType( value : String ) : void
		{
			_eventType = value;
			initListener();
		}
		
		private function initListener() : void
		{
			if( _eventSource != null && _eventType != null )
			{
				_eventSource.addEventListener( _eventType, execute );
			}
		}
		
		
	}
}