package org.swizframework.rpc
{
	import mx.rpc.IResponder;
	
	import org.swizframework.events.CentralDispatcher;

	public class DynamicResponder implements IResponder
	{
		private var resultHandler : Function;
		private var faultHandler : Function;
		private var eventState : Object;
		
		public function DynamicResponder( resultHandler : Function, 
										  faultHandler : Function = null, 
										  eventState : Object = null ) 
		{
			this.resultHandler = resultHandler;
			this.faultHandler = faultHandler;
			this.eventState = eventState;
		}

		public function result( data : Object ):void
		{
			var resultEvent : Object;
			if (eventState != null) {
				resultEvent = new Object();
				/* for each (var key : String in data) {
					resultEvent[key] = data[key];
				}*/
				resultEvent.event = data;
				resultEvent.eventState = eventState;
			} else {
				resultEvent = data;
			}
			resultHandler( resultEvent );
		}
		
		public function fault( info : Object) :void
		{
			if (faultHandler != null)
				faultHandler( info );
			else
				CentralDispatcher.getInstance().genericFault( info );
		}
		
	}
}