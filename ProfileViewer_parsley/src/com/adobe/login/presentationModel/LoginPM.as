package com.adobe.login.presentationModel
{
	import com.adobe.login.control.event.LoginEvent;
	
	import flash.events.EventDispatcher;
	
	import org.spicefactory.parsley.mvc.ApplicationEvent;
	import org.spicefactory.parsley.mvc.FrontController;
	
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
			var event:ApplicationEvent = new LoginEvent( username, password );
			FrontController.root.dispatchEvent( event );
		}

	}
}