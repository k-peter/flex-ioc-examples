package com.adobe.dashboard.presentationModel.user
{
	import com.adobe.dashboard.domain.Friends;
	
	[InjectConstructor]
	public class FriendsPM
	{
		[Bindable]
		public var friends : Friends;
		
		public function FriendsPM( friends : Friends )
		{
			this.friends = friends;
		}
		
	}
}