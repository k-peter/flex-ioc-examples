package ac.iocsample.configuredelegate.control.events
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class PingServerEvent extends CairngormEvent
	{
		public static const PING_SERVER : String
			 = "ac.iocsample.configuredelegate.control.events.PingServerEvent"; 
		
		public function PingServerEvent()
		{
			super( PING_SERVER );
		}
		
	}
}