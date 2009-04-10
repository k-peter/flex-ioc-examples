package com.adobe.dashboard.presentationModel
{
	import com.adobe.dashboard.domain.User;
	
	[Bindable]
	public class DashboardPM
	{
		public var user : User;
		
		public function DashboardPM( user : User )
		{
			this.user = user;
		}
	}
}