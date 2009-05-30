package com.adobe.login.control.event
{
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	
	import mx.rpc.events.ResultEvent;
	
	public class LoginResultEvent extends ResultEvent
	{
		public var user : User;
		public var friends : Friends;
		
		public function LoginResultEvent( user : User, friends : Friends )
		{
			super( ResultEvent.RESULT );
			this.user = user;
			this.friends = friends;
		}

	}
}