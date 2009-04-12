package
{
   import com.adobe.ioc.parsley.Context;
   
   public class MainContext extends Context
   {
      // context name
      public static const CONTEXT_NAME : String = "main";
      
      // presentation model ids
      public static const MAIN_CONTAINER_PM : String = "mainPM";
      public static const DASHBOARD_PM : String	= "dashboardPM";
      public static const PROFILE_PM : String = "profilePM";
      public static const DETAILS_PM : String = "detailsPM";
      public static const FRIENDS_PM : String = "friendsPM";
      public static const SUMMARY_PM : String = "summaryPM";
      
      // config file
      private static const CONFIG_FILE : String = "MainContext.xml";
      
      public function MainContext()
      {
         super( CONTEXT_NAME, CONFIG_FILE, true );
      }
   }
}