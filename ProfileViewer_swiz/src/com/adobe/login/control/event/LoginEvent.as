package com.adobe.login.control.event
{
	import flash.events.Event;

	public class LoginEvent extends Event
	{
		public static const LOGIN : String = "LOGIN";
		
		public var username : String;
		public var password : String;
		
		public function LoginEvent( username : String, password : String )
		{
			super( LOGIN, true);
			this.username = username;
			this.password = password;
		}
		
	}
}