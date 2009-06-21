package com.adobe.cairngorm.samples.store.model.pm.navigation
{
	import com.adobe.ac.navigation.INavigator;
	import com.adobe.ac.navigation.IShowable;
	import com.adobe.ac.navigation.event.NavigateEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.IList;
	
	public class BaseNavigator extends EventDispatcher implements INavigator
	{
		[Bindable]
		public var currentChild : IShowable;
		
		private var _children : IList;
		
		public function get children() : IList
		{
			return _children;
		}
		
		public function set children( value : IList ) : void
		{
			_children = value;
			for each( var showable : IShowable in _children )
			{
				showable.addEventListener( NavigateEvent.MOVE_TO_NEXT, handleMoveToNext );
				showable.addEventListener( NavigateEvent.MOVE_TO_PREVIOUS, handleMoveToPrevious );
			}		
			
			currentChild = IShowable( _children.getItemAt( 0 ) );
		}	
		
		private function handleMoveToNext( event : NavigateEvent ) : void
		{
			if( canMoveToNext )
			{
				moveToNext();
			}
		}
		
		private function handleMoveToPrevious( event : NavigateEvent ) : void
		{
			if( canMoveToPrevious )
			{
				moveToPrevious();
			}
		}
		
		[Bindable("navigation")]
		public function get selectedIndex() : int
		{
			return _children.getItemIndex( currentChild );
		}
		
		public function set selectedIndex( value : int ) : void
		{
			currentChild = IShowable( _children.getItemAt( value ) );
			dispatchEvent( new Event("navigation") );
		}

		public function get canMoveToNext() : Boolean
		{
			return currentChild.canHide;
		}
		
		public function get canMoveToPrevious() : Boolean
		{
			return currentChild.canHide;
		}
		
		public function moveToNext() : void
		{
			var currentChildIndex : int = children.getItemIndex( currentChild );
			currentChild = IShowable( children.getItemAt( currentChildIndex + 1 ) );
			dispatchEvent( new Event( "navigation" ) );
		}
		
		public function moveToPrevious() : void
		{
			var currentChildIndex : int = children.getItemIndex( currentChild );
			currentChild = IShowable( children.getItemAt( currentChildIndex - 1  ) );
			dispatchEvent( new Event( "navigation" ) );
		}
		
		
	}
}