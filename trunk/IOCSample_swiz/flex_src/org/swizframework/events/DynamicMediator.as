package org.swizframework.events
{
	import flash.events.Event;
	
	public class DynamicMediator
	{
		private var handler : Function;
		private var properties : Array;

		public function DynamicMediator( handler : Function, props : String ) { 
			this.handler = handler;
			if (props != null) this.properties = props.split(",");
		}
		
		public function respond( event : Event ) : void {
			
			// build the argument array for the handler function, if all the properties are not found, throw an error
			var args : Array;
			if (properties != null) {
				args = new Array();
				for (var i : int = 0; i < properties.length; i++) {
					// maybe do a try catch for the reference error?
					try {
						args.push(event[properties[i]]);
					} catch ( e : ReferenceError ) {
						throw new Error("DynamicMediator.responseError: Property '"+properties[i]+"' does not exist in event type '"+event.type);
					}
				}
			}
			
			// now call the target method with the arg array
			handler.apply(null, args);
		}
	}
}