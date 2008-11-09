package ac.iocsample.populatedomain.control
{
	import ac.iocsample.common.flicc.control.FliccCairngormFrontController;
	import ac.iocsample.populatedomain.control.commands.PopulateDomainCommand;
	import ac.iocsample.populatedomain.control.events.PopulateDomainEvent;

	public class PopulateDomainController extends FliccCairngormFrontController
	{
		public function PopulateDomainController()
		{
			super();
			initialiseCommands();
		}
		
		protected function initialiseCommands() :void
		{
			addCommand( PopulateDomainEvent.GET_BACKEND, PopulateDomainCommand );
		}
	}
}