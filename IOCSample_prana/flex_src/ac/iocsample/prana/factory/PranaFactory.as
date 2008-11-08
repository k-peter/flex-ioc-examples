package ac.iocsample.prana.factory
{
	import ac.iocsample.util.LogUtil;
	
	import flash.events.Event;
	
	import mx.logging.ILogger;
	
	import org.pranaframework.context.support.XMLApplicationContext;
	
	public class PranaFactory
	{
		private static var _applicationContext : XMLApplicationContext;

		public function PranaFactory()
		{
		}
		
		public static function getObject( id : String ) : *
		{
			if( _applicationContext == null )
			{
				throw new Error("you need to init the factory before requesting an object from it");
			}
			else
			{
				return _applicationContext.getObject( id );
			}
		}
		

		public static function init() : void
		{
	    	_applicationContext = new XMLApplicationContext( "application-context.xml" );
	    	_applicationContext.addEventListener( Event.COMPLETE, onApplicationContextComplete );
	    	_applicationContext.load();
		}


	    private static function onApplicationContextComplete( event : Event ) : void 
	    {
			var logger : ILogger = LogUtil.getLogger( "PranaFactory" );
	    	logger.info( "factory inited" );
	    }

	}
}