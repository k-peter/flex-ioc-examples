package ac.iocsample.populatedomain.control.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PopulateDomainEvent extends CairngormEvent
	{
		public static const POPULATE_DOMAIN : String 
			= "ac.iocsample.populatedomain.control.events.PopulateDomainEvent";
		
		public function PopulateDomainEvent()
		{
			super( POPULATE_DOMAIN );
		}
		
	}
}