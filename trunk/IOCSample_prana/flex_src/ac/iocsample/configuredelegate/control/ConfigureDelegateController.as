package ac.iocsample.configuredelegate.control
{
	import ac.iocsample.configuredelegate.control.commands.PingServerCommand;
	import ac.iocsample.configuredelegate.control.events.PingServerEvent;
	import ac.iocsample.prana.factory.PranaFactory;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.FrontController;
	
	public class ConfigureDelegateController extends FrontController
	{
		public function ConfigureDelegateController()
		{
			initialiseCommands();
		}
		
		private function initialiseCommands() : void
		{
			addCommand( PingServerEvent.PING_SERVER, PingServerCommand );
		}
		
		
	}
}