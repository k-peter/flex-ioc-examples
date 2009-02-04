package ac.iocsample.configuredelegate.control.commands
{
	import ac.iocsample.configuredelegate.business.ISimpleDelegate;
	import ac.iocsample.configuredelegate.business.SimpleDelegate;
	import ac.iocsample.configuredelegate.business.SimpleDelegateMock;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.spicefactory.parsley.context.ApplicationContext; 
 
	public class PingServerCommand implements ICommand
	{
	   private static const LOG : ILogger = Log.getLogger( 
	      "ac.iocsample.configuredelegate.control.commands.PingServerCommand" );
	   
		private var delegate : ISimpleDelegate;
		
		public function PingServerCommand()
		{
			var simpleDelegateMock : SimpleDelegateMock;
			var simpleDelegate : SimpleDelegate;
			
			//It would be preferrable to inject delegate instead of request it.
			//Need to find out if this is possible. So far have only found the getObject( "simpleDelegate" ) call.
			//Whereas I want populateObject( this ) to be called in the controller;
			delegate = ApplicationContext.root.getObject( "simpleDelegate" ) as ISimpleDelegate;
		}
		
		public function execute(event:CairngormEvent):void
		{
			LOG.info( "Command executed using delegate: {0}", delegate  );
		}
	}
}