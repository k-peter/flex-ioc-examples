package org.swizframework.controller
{
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	
	import org.swizframework.Swiz;
	import org.swizframework.SwizBean;
	import org.swizframework.rpc.DynamicCommand;
	
	public class AbstractController implements SwizBean
	{
		
		public var swiz : Swiz;
		
		public function AbstractController() { }
		
		/** Delegates execute service call to Swiz */
		protected function executeServiceCall( call : AsyncToken, resultHandler : Function,
											   faultHandler : Function = null, eventState : Object = null) : void
		{
			Swiz.executeServiceCall( call, resultHandler, faultHandler, eventState );
		}
		
		/** Delegates create command to Swiz */
		protected function createCommand( delayedCall : Function, args : Array, resultHandler : Function, 
											 faultHandler : Function = null, eventState : Object = null ) : DynamicCommand 
		{
			return Swiz.createCommand( delayedCall, args, resultHandler, faultHandler, eventState );
		}
		
	}
}