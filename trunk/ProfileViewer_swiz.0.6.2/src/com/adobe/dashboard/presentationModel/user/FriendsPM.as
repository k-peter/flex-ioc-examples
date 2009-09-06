package com.adobe.dashboard.presentationModel.user
{
	import com.adobe.dashboard.domain.Friends;
	
	[Bindable]
	public class FriendsPM
	{
		[Autowire]
		public var friends : Friends;
		
		public function FriendsPM( friends : Friends = null )
		{
			this.friends = friends;
		}
		
	}
}