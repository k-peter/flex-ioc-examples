package com.adobe
{
	import com.adobe.dashboard.presentationModel.DashboardPM;
	import com.adobe.dashboard.presentationModel.SummaryPM;
	import com.adobe.dashboard.presentationModel.user.DetailsPM;
	import com.adobe.dashboard.presentationModel.user.FriendsPM;
	import com.adobe.ioc.smartypants.Beans;
	import com.adobe.login.presentationModel.LoginPM;
	
	import mx.core.Application;
	
	import net.expantra.smartypants.Injector;
	import net.expantra.smartypants.SmartyPants;
	
	public class Rules
	{
		private var injector : Injector;
		private var beans : Beans;
		
		
		public function Rules( application : Application, beans : Beans )
		{
			injector = SmartyPants.getInjectorFor( application );
			injector.newRule().whenAskedFor( LoginPM ).useValue( beans.loginPM );	
			injector.newRule().whenAskedFor( MainPM ).useValue( beans.mainPM );	
			injector.newRule().whenAskedFor( DashboardPM ).useValue( beans.dashboardPM );	
			injector.newRule().whenAskedFor( DetailsPM ).useValue( beans.detailsPM );	
			injector.newRule().whenAskedFor( FriendsPM ).useValue( beans.friendsPM );	
			injector.newRule().whenAskedFor( SummaryPM ).useValue( beans.summaryPM );	
		}
		
	}
}