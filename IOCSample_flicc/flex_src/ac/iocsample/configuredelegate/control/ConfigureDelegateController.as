package ac.iocsample.configuredelegate.control
{
	import ac.iocsample.common.flicc.control.FliccCairngormFrontController;
	import ac.iocsample.configuredelegate.control.commands.PingServerCommand;
	import ac.iocsample.configuredelegate.control.events.PingServerEvent;
	
	public class ConfigureDelegateController extends FliccCairngormFrontController
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