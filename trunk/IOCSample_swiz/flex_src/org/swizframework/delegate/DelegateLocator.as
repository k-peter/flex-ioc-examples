package org.swizframework.delegate
{
	import flash.utils.Dictionary;
	
	public class DelegateLocator implements IDelagateLocator
	{
		/** Delegate Locator instance */
		private static var _delegateLocator : DelegateLocator;
		
		/** Lock to enforce singleton */
		private static var lock : Boolean = false;
		
		/** Delegate cache */
		private var _delegateCache : Dictionary;
		
		/**
		 * Locked, fau-private constructor.
		 */
		public function DelegateLocator() {
			if (!lock) 
				throw new Error( "DelegateLocator can only be defined once, if you are defining it in mxml.");
			_delegateCache = new Dictionary();
		}
		
		/**
		 * Returns the DelegateLocator instance.
		 */
		public static function getInstance() : DelegateLocator {
			if ( _delegateLocator == null) {
				lock = true;
				_delegateLocator = new DelegateLocator();
				lock = false;
			}
			return _delegateLocator;
		}
		
		/**
		 * Adds a delegate to the local cache. Throws an exception if a delegate already exists for the ID.
		 */
		public function addDelegate( delegateId : String, delegate : AbstractDelegate) : void {
			if ( containsDelegate( delegateId ) )
				throw new Error( "A Delegate already exists for the ID: "+delegateId+", delegates cannot be overwritten." );
			
			_delegateCache[ delegateId ] = delegate;
			trace( "added delegate: "+delegateId );
		}
		
		/**
		 * Locates a delegate by ID and returns it as an AbstractDelegate. Throws an exception if the delegate is not found.
		 */
		public function getDelegate( delegateId : String) : AbstractDelegate {
			if ( !containsDelegate( delegateId ) )
				throw new Error( "Delegate named " + delegateId + " is not defined for this application.");
				
			return _delegateCache[ delegateId ];
		}
		
		/**
		 * Checks the local delegate cache for the delegate by ID.
		 */
		public function containsDelegate( delegateId : String ) : Boolean {
			if ( _delegateCache[ delegateId ] == null )
				return false;
			else
				return true;
		}
		
		/**
		 * Returns the delegate cache (used my swiz for autowiring).
		 */
		public function getAllDelegates() : Dictionary {
			return _delegateCache;
		}
		
	}
}