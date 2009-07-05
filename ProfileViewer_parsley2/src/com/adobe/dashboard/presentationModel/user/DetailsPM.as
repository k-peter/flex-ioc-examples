package com.adobe.dashboard.presentationModel.user
{
	import com.adobe.dashboard.domain.User;
	
	[InjectConstructor]
	[Bindable]
	public class DetailsPM
	{
		public var user : User;
		
		public function DetailsPM( user : User )
		{
			this.user = user;
		}

	}
}