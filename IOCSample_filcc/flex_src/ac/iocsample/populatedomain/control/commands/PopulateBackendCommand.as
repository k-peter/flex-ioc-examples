package ac.iocsample.populatedomain.control.commands
{
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	import ac.iocsample.populatedomain.model.domain.Account;
	import ac.iocsample.util.LogUtil;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.logging.ILogger;
	
	public class PopulateBackendCommand implements ICommand
	{
		/**
		 * Injected by flicc
		 */
		public var account: Account;
		
		public function execute( event : CairngormEvent ) : void
		{
			var getBackendEvent : PopulateBackendEvent = event as PopulateBackendEvent;
			var logger : ILogger = LogUtil.getLogger( this );
			logger.info("setting id");
			account.uniqueId = 1234567;
		}

	}
}