package org.swizframework.controller
{
	import flash.utils.Dictionary;
		
	public interface IControllerLocator
	{
		function addController( managerId : String, manager : AbstractController ) : void;
		
		function getController( managerId : String) : AbstractController;
		
		function containsController( managerId : String ) : Boolean;
		
		function getAllControllers() : Dictionary;
	}
}