package ac.iocsample.configuredelegate.control.commands
{
	import ac.iocsample.configuredelegate.business.ISimpleDelegate;
	import ac.iocsample.configuredelegate.business.SimpleDelegate;
	import ac.iocsample.configuredelegate.business.SimpleDelegateMock;
	import ac.iocsample.prana.factory.PranaFactory;
	import ac.iocsample.util.LogUtil;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.logging.ILogger; 
 
	public class PingServerCommand implements ICommand
	{
		public var delegate : ISimpleDelegate;
		
		public function PingServerCommand()
		{
			var simpleDelegateMock : SimpleDelegateMock;
			var simpleDelegate : SimpleDelegate;
			
			//It would be preferrable to inject delegate instead of request it.
			//Need to find out if this is possible. So far have only found the getObject( "simpleDelegate" ) call.
			//Whereas I want populateObject( this ) to be called in the controller;
			delegate = PranaFactory.getObject( "simpleDelegate" );
		}
		
		public function execute(event:CairngormEvent):void
		{
			
			var log : ILogger = LogUtil.getLogger( this );
			log.info( "delegate: " +  delegate  );
		}
		
	}
}