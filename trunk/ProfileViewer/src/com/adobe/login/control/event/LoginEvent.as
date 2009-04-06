package com.adobe.login.control.event
{
	import flash.events.Event;

	public class LoginEvent extends Event
	{
		public static const LOGIN_EVENT : String = "com.adobe.login.control.event.LoginEvent";
		
		public var username : String;
		public var password : String;
		
		public function LoginEvent( username : String, password : String )
		{
			super( LOGIN_EVENT, true);
			this.username = username;
			this.password = password;
		}
		
	}
}