package ac.iocsample.populatedomain.control
{
	import ac.iocsample.common.flicc.control.FliccCairngormFrontController;
	import ac.iocsample.populatedomain.control.commands.PopulateBackendCommand;
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;

	public class BackendController extends FliccCairngormFrontController
	{
		public function BackendController()
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