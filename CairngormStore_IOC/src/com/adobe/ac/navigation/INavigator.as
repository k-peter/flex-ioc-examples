package com.adobe.ac.navigation
{
	import mx.collections.IList;
	
	public interface INavigator
	{
		function get children() : IList;
		function set children( value : IList ) : void;
		function get selectedIndex() : int;
      	function get canMoveToPrevious() : Boolean;
      	function get canMoveToNext() : Boolean;
      	function moveToNext() : void;
      	function moveToPrevious() : void;
	}
}