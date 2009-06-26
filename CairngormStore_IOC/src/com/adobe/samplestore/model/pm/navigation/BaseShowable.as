package com.adobe.samplestore.model.pm.navigation
{
	import com.adobe.ac.navigation.IShowable;
	import com.adobe.ac.navigation.event.NavigationEvent;
	
	import flash.events.EventDispatcher;
	
	[Event( name="moveToNext",
			type="com.adobe.ac.navigation.event.NavigationEvent")]
	public class BaseShowable extends EventDispatcher implements IShowable
	{
		public function get canShow():Boolean
		{
			return true;
		}
		
		public function get canHide():Boolean
		{
			return true;
		}
		
		public function moveToNext() : void
		{
			dispatchEvent( new NavigationEvent( NavigationEvent.MOVE_TO_NEXT ) );
		}
		
		public function moveToPrevious() : void
		{
			//not implemented
		}
		
		public function get name() : String
		{
			throw new Error( "should be overriden" );
		}
		
	}
}