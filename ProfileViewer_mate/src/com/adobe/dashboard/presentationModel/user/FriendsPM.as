package com.adobe.dashboard.presentationModel.user
{
	import com.adobe.dashboard.domain.Friends;
	
	public class FriendsPM
	{
		[Bindable]
		public var friends : Friends;
		
		public function FriendsPM( friends : Friends = null )
		{
			this.friends = friends;
		}
		
	}
}