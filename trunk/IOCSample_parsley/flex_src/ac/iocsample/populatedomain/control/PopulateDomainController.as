package ac.iocsample.populatedomain.control
{
	import ac.iocsample.populatedomain.control.commands.PopulateDomainCommand;
	import ac.iocsample.populatedomain.control.events.PopulateDomainEvent;
	
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
			addCommand( PopulateDomainEvent.POPULATE_DOMAIN, PopulateDomainCommand );
		}
	}
}