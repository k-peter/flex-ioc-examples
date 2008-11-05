package ac.iocsample.populatedomain.control.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PopulateBackendEvent extends CairngormEvent
	{
		public static const GET_BACKEND : String 
			= "ac.iocsample.populatedomain.control.events.GetBackendEvent";
		
		public function PopulateBackendEvent()
		{
			super( GET_BACKEND );
		}
		
	}
}