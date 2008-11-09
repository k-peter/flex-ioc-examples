package ac.iocsample.populatedomain.control.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PopulateDomainEvent extends CairngormEvent
	{
		public static const GET_BACKEND : String 
			= "ac.iocsample.populatedomain.control.events.PopulateDomainEvent";
		
		public function PopulateDomainEvent()
		{
			super( GET_BACKEND );
		}
		
	}
}