package ac.iocsample.populatedomain.control
{
	import ac.iocsample.populatedomain.control.commands.PopulateBackendCommand;
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	
	import com.adobe.cairngorm.control.FrontController;

	public class PopulateDomainController extends FrontController
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