package com.adobe.dashboard.domain
{
	[Bindable]
	public class User
	{
		public var forename : String;
		public var surname : String;
		public var nickname : String;
		
		public function User( forename : String = null, surname : String = null, nickname : String = null )
		{
			this.forename = forename;
			this.surname = surname;
			this.nickname = nickname;
		}

	}
}