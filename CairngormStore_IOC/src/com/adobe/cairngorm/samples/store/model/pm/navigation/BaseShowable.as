package com.adobe.cairngorm.samples.store.model.pm.navigation
{
	import com.adobe.ac.navigation.IShowable;
	import com.adobe.ac.navigation.event.NavigateEvent;
	
	import flash.events.EventDispatcher;
	
	[Event( name="moveToNext",
			type="com.adobe.ac.navigation.event.NavigateEvent")]

	[Event( name="moveToPrevious",
			type="com.adobe.ac.navigation.event.NavigateEvent")]
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
			dispatchEvent( new NavigateEvent( NavigateEvent.MOVE_TO_NEXT ) );
		}
		
		public function moveToPrevious() : void
		{
			dispatchEvent( new NavigateEvent( NavigateEvent.MOVE_TO_PREVIOUS ) );
		}
		
	}
}