package ac.iocsample.populatedomain.control.commands
{
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	import ac.iocsample.populatedomain.model.domain.Account;
	import ac.iocsample.prana.factory.PranaFactory;
	import ac.iocsample.util.LogUtil;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.logging.ILogger;
	
	import org.pranaframework.context.support.XMLApplicationContext;
	
	public class PopulateBackendCommand implements ICommand
	{
		private var _applicationContext : XMLApplicationContext = new XMLApplicationContext( "application-context.xml" );

		public function execute( event : CairngormEvent ) : void
		{
			var getBackendEvent : PopulateBackendEvent = event as PopulateBackendEvent;
			var logger : ILogger = LogUtil.getLogger( this );
			logger.info("setting id");
			var account : Account = PranaFactory.getObject("account");
			account.uniqueId = 10101010;
		}

	}
}