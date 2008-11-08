package ac.iocsample.populatedomain.control
{
	import ac.iocsample.populatedomain.control.commands.PopulateBackendCommand;
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.FrontController;
	
	import flash.utils.getQualifiedClassName;
	
	import flicc.factory.IObjectFactory;

	public class BackendController extends FrontController
	{
		
		[Bindable]
		public var factory : IObjectFactory;
		
		public function BackendController()
		{
			super();
			
			initialiseCommands();
		}
		
		protected function initialiseCommands() :void
		{
			addCommand( PopulateBackendEvent.GET_BACKEND, PopulateBackendCommand );
		}
		
		override protected function executeCommand( event : CairngormEvent ) : void
		{
        	var commandToInitialise : Class = getCommand( event.type );
        	var commandToExecute : ICommand = new commandToInitialise();
        	
        	factory.configure( commandToExecute, getQualifiedClassName( commandToExecute ).replace("::",".") );
			
			commandToExecute.execute( event );
		}
	}
}