package com.adobe.login.presentationModel
{
	import com.adobe.login.control.event.LoginEvent;
	import com.asfusion.mate.events.Dispatcher;
	
	import flash.events.EventDispatcher;
	[Bindable]
	public class LoginPM extends EventDispatcher
	{
		public var username : String;
		public var password : String;
		
		public function setUsername( username : String ) : void
		{
			this.username = username;
		}
		
		public function setPassword( password : String ) : void
		{
			this.password = password;
		}
		
		public function login() : void
		{
			var myDispatcher:Dispatcher = new Dispatcher();
			myDispatcher.dispatchEvent( new LoginEvent( username, password ) );
		}

	}
}