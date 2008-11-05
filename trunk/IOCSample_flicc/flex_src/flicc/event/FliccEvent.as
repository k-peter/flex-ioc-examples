package flicc.event
{
	
import flash.events.Event;

public class FliccEvent extends Event
{
	public static const CONFIGURE : String = "configure" ; 
	
	public var objectId : String ;
	public var object : Object; 
	
	public function FliccEvent( type : String, objectId : String, object : Object )
	{
		super( type, true, true );
		
		this.objectId = objectId;
		this.object = object;
	}
	
}

}