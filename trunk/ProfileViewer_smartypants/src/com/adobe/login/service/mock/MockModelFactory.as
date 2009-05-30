package com.adobe.login.service.mock
{
	import com.adobe.dashboard.domain.Friends;
	import com.adobe.dashboard.domain.User;
	
	import mx.collections.ArrayCollection;
	
	public class MockModelFactory
	{
		public static function createUser( username : String ) : User
		{
			return new User(username, "Franklin", "franky");
		}
		
		public static function createFriends() : Friends
		{
			var friends : Friends = new Friends();
			friends.category = "Your friends";
			var friendsList : ArrayCollection = new ArrayCollection();
			friendsList.addItem( new User("Arthur", "Atkins", "archie") );
			friendsList.addItem( new User("Belinda", "Bennett", "bebe") );
			friendsList.addItem( new User("Charles", "Clancy", "chase") );
			friendsList.addItem( new User("Debbie", "Donahue", "dee") );
			friendsList.addItem( new User("Eamonn", "Evans", "evo") );
			friends.friendsList = friendsList;
			return friends;
		}
	}
}