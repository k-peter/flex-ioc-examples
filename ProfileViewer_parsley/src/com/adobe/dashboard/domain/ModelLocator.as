package com.adobe.dashboard.domain
{
	
	[Bindable]
	public class ModelLocator
	{
		private static var instance : ModelLocator;
		private static var instanceRequested : Boolean;
		
		public var user : User = new User("", "", "");
		public var friends : Friends = new Friends();
		
		public function ModelLocator()
		{
			if( instance != null )
			{
				throw new Error("use ModelLocator.getInstance() instead of new ModelLocator()");
			}
		}
		
		public static function getInstance() : ModelLocator
		{
			if( instance == null )
			{
				instance = new ModelLocator();
			}
			return instance;
		}

	}
}