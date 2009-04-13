package com.adobe.login.presentationModel
{
	import com.adobe.login.control.event.LoginEvent;
	
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
			dispatchEvent( new LoginEvent( username, password ) );
		}

	}
}