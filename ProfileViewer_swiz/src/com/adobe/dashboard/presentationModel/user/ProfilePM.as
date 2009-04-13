package com.adobe.dashboard.presentationModel.user
{
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	
	[Bindable]
	public class ProfilePM
	{
		[Autowire(bean="user")]
		public var user : User;
		
		public function ProfilePM( user : User = null )
		{
			this.user = user;
		}

	}
}