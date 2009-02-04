package ac.iocsample.configuredelegate.business
{
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class SimpleDelegate implements ISimpleDelegate
	{
      private static const LOG : ILogger = Log.getLogger( 
         "ac.iocsample.configuredelegate.business.SimpleDelegate" );

		//set by prana
		private var _service : RemoteObject;
		
		public function SimpleDelegate()
		{
		}
		
		public function ping(message:String):void
		{
		
		}
		
		public function set service( value : RemoteObject ) : void
		{
		   LOG.debug( "Setting service for delegate: {0}", value );
			_service = value;
		}
		
		public function get service() : RemoteObject
		{
			return _service;
		}
	}
}