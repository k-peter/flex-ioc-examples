package org.swizframework.service
{
	import flash.utils.Dictionary;
	
	import mx.rpc.AbstractService;
	import mx.rpc.http.HTTPService;
	import mx.rpc.remoting.RemoteObject;
	
	public class ServiceLocator implements IServiceLocator
	{
		
		/** Service Locator instance */
		private static var _serviceLocator : ServiceLocator;
		
		/** Lock to enforce singleton */
		private static var lock : Boolean = false;
		
		/** Service cache */
		private var _serviceCache : Dictionary;
		
		/**
		 * Locked, fau-private constructor.
		 */
		public function ServiceLocator() {
			if (!lock) 
				throw new Error( "ServiceLocator can only be defined once, if you are defining it in mxml.");
			_serviceCache = new Dictionary();
		}
		
		/**
		 * Returns the ServiceLocator instance.
		 */
		public static function getInstance() : ServiceLocator {
			if ( _serviceLocator == null) {
				lock = true;
				_serviceLocator = new ServiceLocator();
				lock = false;
			}
			return _serviceLocator;
		}
		
		/**
		 * Adds a service to the local cache. Throws an exception if a service already exists for the ID.
		 */
		public function addService( serviceId : String, service : AbstractService ) : void {
			if ( containsService( serviceId ) )
				throw new Error( "A Service already exists for the ID: "+serviceId+", services cannot be overwritten." );
			
			_serviceCache[ serviceId ] = service;
			trace( "added service: "+serviceId );
		}
		
		/**
		 * Locates a service by ID and returns it as an RemoteObject. Throws an exception if the service 
		 * is not found or is not an RemoteObject object.
		 */
		public function getRemoteService( serviceId : String ) : RemoteObject {
			var service : AbstractService = getService( serviceId );
			
			if ( !service is RemoteObject )
				throw new Error( "Service named " + serviceId + " is not a RemoteObject.");
				
			return service as RemoteObject;
		}
		
		/**
		 * Locates a service by ID and returns it as an HTTPService. Throws an exception if the service 
		 * is not found or is not an HTTPService object.
		 */
		public function getHttpService( serviceId : String ) : HTTPService {
			var service : AbstractService = getService( serviceId );
			
			if ( !service is HTTPService )
				throw new Error( "Service named " + serviceId + " is not an HttpService.");
				
			return service as HTTPService;
		}
		
		/**
		 * Locates a service by ID and returns it as an AbstractService. Use typed get methods to return services as 
		 * concrete typed objects. Throws an exception if the service is not found.
		 */
		public function getService( serviceId : String ) : AbstractService {
			if ( !containsService( serviceId ) )
				throw new Error( "Service named " + serviceId + " is not defined for this application.");
				
			return _serviceCache[ serviceId ];
		}
		
		/**
		 * Checks the local service cache for the service by ID.
		 */
		public function containsService( serviceId : String ) : Boolean {
			if ( _serviceCache[ serviceId ] == null )
				return false;
			else
				return true;
		}
		
		/**
		 * Returns the service cache (used my swiz for autowiring).
		 */
		public function getAllServices() : Dictionary {
			return _serviceCache;
		}

	}
}