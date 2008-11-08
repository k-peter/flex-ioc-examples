package ac.iocsample.populatedomain.control.commands
{
	import ac.iocsample.populatedomain.control.events.PopulateBackendEvent;
	import ac.iocsample.populatedomain.model.domain.Backend;
	import ac.iocsample.prana.factory.PranaFactory;
	import ac.iocsample.util.LogUtil;
	
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.Event;
	
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
			var backend : Backend = PranaFactory.getObject("backend");
			backend.uniqueId = 10101010;
		}

	}
}