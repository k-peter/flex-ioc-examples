package ac.iocsample.common.flicc.control
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.control.FrontController;
	
	import flash.utils.getQualifiedClassName;
	
	import flicc.factory.IObjectFactory;

	public class FliccCairngormFrontController extends FrontController
	{
		[Bindable]
		public var factory : IObjectFactory;
		
		public function FliccCairngormFrontController()
		{
			super();
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