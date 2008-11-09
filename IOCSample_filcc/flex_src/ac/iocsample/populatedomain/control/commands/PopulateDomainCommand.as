package ac.iocsample.populatedomain.control.commands
{
	import ac.iocsample.populatedomain.control.events.PopulateDomainEvent;
	import ac.iocsample.populatedomain.model.domain.Account;
	import ac.iocsample.util.LogUtil;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.logging.ILogger;
	
	public class PopulateDomainCommand implements ICommand
	{
		//Injected by flicc
		public var account: Account;
		
		public function execute( event : CairngormEvent ) : void
		{
			var getBackendEvent : PopulateDomainEvent = event as PopulateDomainEvent;
			var logger : ILogger = LogUtil.getLogger( this );
			logger.info("setting id");
			account.uniqueId = 1234567;
		}

	}
}