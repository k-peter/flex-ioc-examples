package com.adobe.dashboard.domain
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class Friends
	{
		public var category : String;
		public var friendsList : ArrayCollection;
	
		public function update( friends : Friends ) : void
		{
			this.category = friends.category;
			this.friendsList = friends.friendsList;
		}
	}
	
	
}