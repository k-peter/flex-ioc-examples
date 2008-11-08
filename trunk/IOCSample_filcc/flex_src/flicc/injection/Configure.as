package flicc.injection
{
    
import flicc.event.FliccEvent;

import mx.core.Application;
import mx.core.UIComponent;
import mx.events.FlexEvent;

public class Configure extends UIComponent
{
	public var target : Object;
	public var objectId : String;
		
	override public function initialize() : void
	{
		var application : Application = Application( Application.application );
		
		if( !application.initialized )
		{
			application.addEventListener( FlexEvent.CREATION_COMPLETE, 
					handleApplicationCreationComplete );
		}
		else
		{
			addEventListener( FlexEvent.CREATION_COMPLETE,
					handleCreationComplete );
		}
		
		super.initialize();
	}
	
	private function dispatch() : void 
	{ 
		if( target == null )
		{
			target = parent;	
		}
			
		if( objectId == null )
		{
			objectId = UIComponent( parent ).id;			
		}	
		
		dispatchEvent( new FliccEvent( FliccEvent.CONFIGURE, objectId, target ) );
	}
	
	private function handleApplicationCreationComplete( event : FlexEvent ) : void
	{
		if( initialized )
		{
			dispatch();
		}
		else
		{
			addEventListener( FlexEvent.CREATION_COMPLETE,
					handleCreationComplete );
		}
	}
	
	internal function handleCreationComplete( event : FlexEvent ) : void
	{
		dispatch();
	}
	
	override public function get includeInLayout() : Boolean
	{
		return false;
	}
}

}