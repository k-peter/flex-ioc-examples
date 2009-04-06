package com.adobe.dashboard.presentationModel.user
{
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	
	[Bindable]
	public class ProfilePM
	{
		public var user : User;
		
		public var detailsPM : DetailsPM;
		public var friendsPM : FriendsPM;
		
		public function ProfilePM( user : User, friends : Friends )
		{
			this.user = user;
			detailsPM = new DetailsPM( user );
			friendsPM = new FriendsPM( friends );
		}

	}
}