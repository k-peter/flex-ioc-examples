package org.swizframework.rpc
{
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	
	import org.swizframework.command.CommandChain;
	import org.swizframework.events.CentralDispatcher;
	
	public class DynamicCommand implements IResponder
	{
		private var delayedCall : Function;
		private var args : Array;
		private var resultHandler : Function;
		private var faultHandler : Function;
		private var eventState : Object;
		
		// command chain, if this command is chained
		private var chain : CommandChain;
		
		// complete / fault are read by a CommandChain object
		public var executed : Boolean = false;
		public var complete : Boolean = false;
		public var failed : Boolean = false;
		
		public function DynamicCommand( delayedCall : Function, 
										args : Array, 
										resultHandler : Function, 
										faultHandler : Function = null,
										eventState : Object = null)
		{
			this.delayedCall = delayedCall;
			this.args = args;
			this.resultHandler = resultHandler;
			this.faultHandler = faultHandler;
			this.eventState = eventState;
		}
		
		public function execute() : void {
			executed = true;
			if (delayedCall != null) {
				var call : AsyncToken;
				if (this.args != null)
					call = delayedCall.apply(null,this.args);
				else
					call = delayedCall();
				call.addResponder(this);
			}
		}
		
		public function result( data : Object ):void
		{
			var resultEvent : Object;
			if (eventState != null) {
				resultEvent = new Object();
				resultEvent.event = data;
				resultEvent.eventState = eventState;
			} else {
				resultEvent = data;
			}
			resultHandler( resultEvent );
			complete = true;
			if (chain != null)
				chain.proceed();
		}
		
		public function fault( info : Object) :void
		{
			failed = true;
			if (faultHandler != null)
				faultHandler( info );
			else
				CentralDispatcher.getInstance().genericFault( info );
			if (chain != null)
				chain.fail();
		}
		
		public function setCommandChain( chain : CommandChain ) : void {
			this.chain = chain;
		}

	}
}