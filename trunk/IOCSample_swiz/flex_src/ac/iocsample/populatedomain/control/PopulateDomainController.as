package ac.iocsample.populatedomain.control
{
	import ac.iocsample.common.swiz.control.SwizFrontController;
	import ac.iocsample.populatedomain.control.commands.PopulateBackendCommand;
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;

	public class PopulateDomainController extends SwizFrontController
	{
		public function PopulateDomainController()
		{
			super();
			
			initialiseCommands();
		}
		
		protected function initialiseCommands() :void
		{
			addCommand( PopulateBackendEvent.GET_BACKEND, PopulateBackendCommand );
		}
		
	}
}