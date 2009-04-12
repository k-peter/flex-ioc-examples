package com.adobe.login.control.event
{
	import org.spicefactory.parsley.mvc.ApplicationEvent;

	public class LoginEvent extends ApplicationEvent
	{
		public static const LOGIN_EVENT : String = "com.adobe.login.control.event.LoginEvent";
		
		public var username : String;
		public var password : String;
		
		public function LoginEvent( username : String, password : String )
		{
			super( LOGIN_EVENT);
			this.username = username;
			this.password = password;
		}
		
	}
}