package com.adobe.login.control.controller
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	import com.adobe.login.service.LoginDelegate;
	import com.adobe.util.logging.LogUtil;
	
	import mx.rpc.events.ResultEvent;
	
	import org.swizframework.controller.AbstractController;

	public class LoginController extends AbstractController
	{
		[Autowire]
		public var client : AuthenticationClient;
		
		[Autowire]
		public var user : User;
		
		[Autowire]
		public var friends : Friends;
		
		[Autowire]
		public var delegate : LoginDelegate;
		
		[Mediate(event="LOGIN", properties="username,password")]
		public function login( username : String, password : String ) : void
		{
			LogUtil.getLogger( this ).info( "username: {0}, password {1} ", username, password );
			executeServiceCall( delegate.authenticate( username, password ), result );
		}
		
		public function result(data:Object):void
		{
			var resultEvent : ResultEvent = ResultEvent( data );
			user.update( resultEvent.result.user );
			friends.update( resultEvent.result.friends );
			
			client.authenticated = true;
		}
	}
}