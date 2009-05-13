package com.adobe.dashboard.presentationModel
{
	import com.adobe.dashboard.domain.User;
	
	[Bindable]
	public class DashboardPM
	{
		[Autowire(bean="user")]
		public var user : User;
		
		public function DashboardPM( user : User = null )
		{
			this.user = user;
		}
		
		public function capitalise( value : String ) : String
		{
			var firstLetter : String = value.charAt( 0 );
			var remainder : String = value.substr( 1,value.length );
			return firstLetter.toUpperCase() + remainder;
		}

	}
}