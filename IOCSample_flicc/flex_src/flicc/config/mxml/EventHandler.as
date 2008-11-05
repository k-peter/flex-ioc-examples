package flicc.config.mxml
{

import flicc.config.event.IEventHandler;

/**
 * An IEventHandler to be used with an MxmlFactoryConfig.
 * 
 * @mxml
 * <pre>
 * &lt;ObjectDescriptor objectId="Class10Id" clazz="{ Class10 }" &gt;
 * 	&lt;handlers&gt;
 *  	&lt;EventHandler eventName="{ Class9.EVENT_NAME }" handler="handleEvent"&gt;
 *			&lt;source&gt;
 *				&lt;Ref objectId="Class9Id" /&gt;
 *          &lt;/source&gt;
 *      &lt;/EventHandler&gt;
 *	&lt;/handlers&gt;
 * </pre>
 * 
 * @see flicc.config.mxml.ObjectDescriptor#handlers
 */
public class EventHandler implements IEventHandler
{
	private var _eventName : String;
   	private var _source : *;
   		  
	/**
	 * The name of the function that will handle the event. Note that the event
	 * object is always passed.s  
	 */ 
	public var handler : String;
   
   	/**
   	 * @inheritDoc
   	 */ 
	public function get source() : * 
	{
    	return _source;
	}
	
	public function set source( value : * ) : void
	{
		_source = value;
	}
    
    /**
     * @inheritDoc
    */   
	public function get eventName() : String
	{
		return _eventName;
	}
	
	public function set eventName( value : String ) : void
	{
		_eventName = value;		
	}

	/**
	 * @inheritDoc
	 */ 
	public function apply( source : *, instance : Object ) : void
	{
		var handlerFunction : Function = instance[ handler ] as Function;
        var target : Object;

        if( source is String )
        {
        	target = instance[ source ];
        }
        else
       	{
           target = source;
        }

		target.addEventListener( eventName, handlerFunction );
	}
}

}