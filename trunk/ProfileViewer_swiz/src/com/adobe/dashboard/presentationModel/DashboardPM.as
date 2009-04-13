package com.adobe.dashboard.presentationModel
{
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	import com.adobe.dashboard.presentationModel.user.ProfilePM;
	
	[Bindable]
	public class DashboardPM
	{
		[Autowire(bean="user")]
		public var user : User;
		
		public function DashboardPM( user : User = null )
		{
			this.user = user;
		}

	}
}