package ac.iocsample.common.swiz.control
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.FrontController;
	
	import org.swizframework.Swiz;

	public class SwizFrontController extends FrontController
	{
		[Bindable]
		public var swiz : Swiz;
		
		public function SwizFrontController()
		{
			super();
		}
		
		override protected function executeCommand( event : CairngormEvent ) : void
		{
        	var commandToInitialise : Class = getCommand( event.type );
        	var commandToExecute : ICommand = new commandToInitialise();
        	
        	swiz.autowireObject( commandToExecute );
			commandToExecute.execute( event );
		}
	}
}