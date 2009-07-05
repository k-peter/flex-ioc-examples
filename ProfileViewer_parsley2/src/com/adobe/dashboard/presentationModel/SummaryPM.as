package com.adobe.dashboard.presentationModel
{
	import com.adobe.dashboard.domain.Friends;
	
	import mx.binding.utils.BindingUtils;
	
	[Bindable]
	public class SummaryPM
	{
		[Inject]
		public var friends : Friends;
		
		public var numberOfFriends : int;
		
		public function SummaryPM()
		{
			BindingUtils.bindProperty( this, "numberOfFriends", this, ["friends", "friendsList", "length"] );
		}
	}
}