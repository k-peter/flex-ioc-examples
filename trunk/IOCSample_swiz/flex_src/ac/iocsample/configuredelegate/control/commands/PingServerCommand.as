package ac.iocsample.configuredelegate.control.commands
{
	import ac.iocsample.configuredelegate.business.ISimpleDelegate;
	import ac.iocsample.configuredelegate.business.SimpleDelegate;
	import ac.iocsample.configuredelegate.business.SimpleDelegateMock;
	import ac.iocsample.util.LogUtil;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.logging.ILogger; 
 
	public class PingServerCommand implements ICommand
	{
		[Autowire(bean="delegate")]
		public var delegate : ISimpleDelegate;
		
		public function PingServerCommand()
		{
			var simpleDelegateMock : SimpleDelegateMock;
			var simpleDelegate : SimpleDelegate;
			
			//delegate = new SimpleDelegate();
		}
		
		public function execute(event:CairngormEvent):void
		{
			
			var log : ILogger = LogUtil.getLogger( this );
			log.info( "delegate: " +  delegate  );
		}
		
	}
}