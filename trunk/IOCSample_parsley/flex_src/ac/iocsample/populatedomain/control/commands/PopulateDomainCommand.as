package ac.iocsample.populatedomain.control.commands
{
	import ac.iocsample.populatedomain.control.events.PopulateDomainEvent;
	import ac.iocsample.populatedomain.model.domain.Account;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.spicefactory.parsley.context.ApplicationContext;
	
	public class PopulateDomainCommand implements ICommand
	{
	   private static const LOG : ILogger = Log.getLogger( 
	      "ac.iocsample.populatedomain.control.commands.PopulateDomainCommand" );
	   
		public function execute( event : CairngormEvent ) : void
		{
			var getBackendEvent : PopulateDomainEvent = event as PopulateDomainEvent;
			var account : Account = Account( ApplicationContext.root.getObject( "account" ) );
			account.uniqueId = 10101010;
         LOG.debug( "Set account ID" );
		}
	}
}