package ac.iocsample.configuredelegate.business
{
	import mx.rpc.remoting.RemoteObject;
	
	public class SimpleDelegate implements ISimpleDelegate
	{
		[Autowire(bean="remoteObject")]
		public var service : RemoteObject;
		//private var _service : RemoteObject;
		
		public function SimpleDelegate()
		{
			//_service = ServiceLocator.getInstance().getRemoteObject( "simpleService" )
		}
		
		public function ping(message:String):void
		{
			//service call here
		}
		
		/*public function set service( value : RemoteObject ) : void
		{
			_service = value;
			var log : ILogger = LogUtil.getLogger(this);
			log.info( "service: " + _service );
		}
		
		public function get service() : RemoteObject
		{
			return _service;
		}*/
		
	}
}