package flicc.config.event
{

/**
 * Describes an event handler to be applied on an object created from an 
 * <code>IObjectDescriptor</code>.
 * 
 * @see flicc.config.IObjectDescriptor#eventHandlers
 */
public interface IEventHandler
{
	/**
	 * The object that dispatches the event. 
	 * 
	 * <p>
	 * The value of source will be resolved before being passed to the <code>
	 * apply</code> method following the same rules defined in <code>
	 * IDependency</code>.
	 * </p>
	 * 
	 * @see flicc.config.IDependency#value
	 */
	function get source() : *;
  
  	/**
  	 * The name of the event to listen for.
  	 */ 
  	function get eventName() : String;
  	
  	/**
  	 * Add the event listener on to instance from source 
  	 */  
  	function apply( source : *, instance : Object ) : void;   
}

}