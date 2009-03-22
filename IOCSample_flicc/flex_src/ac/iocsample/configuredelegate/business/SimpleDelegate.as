package ac.iocsample.configuredelegate.business
{
	import ac.iocsample.util.LogUtil;
	
	import mx.binding.utils.BindingUtils;
	import mx.logging.ILogger;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class SimpleDelegate implements ISimpleDelegate
	{
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
			_service = value;
			var log : ILogger = LogUtil.getLogger(this);
			log.info( "service: " + _service );
		}
		
		
		public function get service() : RemoteObject
		{
			return _service;
		}
		
	}
}