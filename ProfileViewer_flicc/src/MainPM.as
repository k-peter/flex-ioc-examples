package 
{
	import com.adobe.dashboard.domain.AuthenticationClient;
	import com.adobe.dashboard.presentationModel.DashboardPM;
	
	[Bindable]
	public class MainPM implements AuthenticationClient
	{
		public static const UNAUTHENTICATED : String = null;
		public static const AUTHENTICATED : String = "AUTHENTICATED";
		public static const AUTHENTICATION_ERROR : String = "AUTHENTICATION_ERROR";
		
		public var dashboardPM : DashboardPM;
		
		public var state : String = UNAUTHENTICATED;
		
		public function set authenticated( value : Boolean ) : void
		{
			if( value ) 
			{
				state = AUTHENTICATED;
			}
			else
			{
				state = AUTHENTICATION_ERROR;
			}
		}
	}
}