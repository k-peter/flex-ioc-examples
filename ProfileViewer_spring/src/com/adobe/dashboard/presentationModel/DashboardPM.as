package com.adobe.dashboard.presentationModel
{
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	import com.adobe.dashboard.presentationModel.user.ProfilePM;
	
	[Bindable]
	public class DashboardPM
	{
		public var user : User;
		
		public function DashboardPM( user : User )
		{
			this.user = user;
		}
		
		public function capitalise( value : String ) : String
		{
			var firstLetter : String = value.charAt( 0 );
			var remainder : String = value.substr( 1,value.length );
			return firstLetter.toUpperCase() + remainder;
		}

	}
}