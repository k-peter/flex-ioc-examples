package com.adobe.dashboard.domain
{
	[Bindable]
	public class User
	{
		public var forename : String;
		public var surname : String;
		public var nickname : String;
		
		public function User( forename : String, surname : String, nickname : String )
		{
			this.forename = forename;
			this.surname = surname;
			this.nickname = nickname;
		}

	}
}