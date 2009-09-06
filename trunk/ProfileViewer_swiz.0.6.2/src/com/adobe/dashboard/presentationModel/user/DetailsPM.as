package com.adobe.dashboard.presentationModel.user
{
	import com.adobe.dashboard.domain.User;
	
	[Bindable]
	public class DetailsPM
	{
		[Autowire(bean="user")]
		public var user : User;
		
		public function DetailsPM( user : User = null )
		{
			this.user = user;
		}

	}
}