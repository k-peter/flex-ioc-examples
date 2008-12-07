package org.swizframework.service
{
	import flash.utils.Dictionary;
	
	import mx.rpc.AbstractService;
	import mx.rpc.http.HTTPService;
	import mx.rpc.remoting.RemoteObject;
	
	/**
	 * Interface for Swiz Service Locator Implementation
	 */
	public interface IServiceLocator
	{
		function addService( serviceId : String, service : AbstractService ) : void;
		
		function getService( serviceId : String ) : AbstractService;
		
		function getRemoteService( serviceId : String ) : RemoteObject;
		
		function getHttpService( serviceId : String ) : HTTPService;
		
		function containsService( serviceId : String ) : Boolean;
		
		function getAllServices() : Dictionary;
	}
}