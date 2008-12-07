package org.swizframework.controller
{
	import flash.utils.Dictionary;
	
	public class ControllerLocator implements IControllerLocator
	{
		/** Manager Locator instance */
		private static var _controllerLocator : ControllerLocator;
		
		/** Lock to enforce singleton */
		private static var lock : Boolean = false;
		
		/** Controller cache */
		private var _controllerCache : Dictionary;
		
		/**
		 * Locked, fau-private constructor.
		 */
		public function ControllerLocator() {
			if (!lock) 
				throw new Error( "ControllerLocator can only be defined once, if you are defining it in mxml.");
			_controllerCache = new Dictionary();
		}
		
		/**
		 * Returns the ManagerLocator instance.
		 */
		public static function getInstance() : ControllerLocator {
			if ( _controllerLocator == null) {
				lock = true;
				_controllerLocator = new ControllerLocator();
				lock = false;
			}
			return _controllerLocator;
		}
		
		/**
		 * Adds a manager to the local cache. Throws an exception if a manager already exists for the ID.
		 */
		public function addController( controllerId : String, controller : AbstractController) : void {
			if ( containsController( controllerId ) )
				throw new Error( "A Controller already exists for the ID: "+controllerId+", controllers cannot be overwritten." );
			
			_controllerCache[ controllerId ] = controller;
			trace( "added controllers: "+controllerId );
		}
		
		/**
		 * Locates a manager by ID and returns it as an AbstractManager. Throws an exception if the manager is not found.
		 */
		public function getController( controllerId : String) : AbstractController {
			if ( !containsController( controllerId ) )
				throw new Error( "Controller named " + controllerId + " is not defined for this application.");
				
			return _controllerCache[ controllerId ];
		}
		
		/**
		 * Checks the local manager cache for the manager by ID.
		 */
		public function containsController( controllerId : String ) : Boolean {
			if ( _controllerCache[ controllerId ] == null )
				return false;
			else
				return true;
		}
		
		/**
		 * Returns the manager cache (used my swiz for autowiring.
		 */
		public function getAllControllers() : Dictionary {
			return _controllerCache;
		}
		
	}
}