package ac.iocsample.configuredelegate.control
{
	import ac.iocsample.common.swiz.control.SwizFrontController;
	import ac.iocsample.configuredelegate.control.commands.PingServerCommand;
	import ac.iocsample.configuredelegate.control.events.PingServerEvent;
	
	public class ConfigureDelegateController extends SwizFrontController
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