package org.swizframework.delegate
{
	import flash.utils.Dictionary;
	
	public interface IDelagateLocator
	{
		function addDelegate( delegateId : String, delegate : AbstractDelegate ) : void;
		
		function getDelegate( delegateId : String) : AbstractDelegate;
		
		function containsDelegate( delegateId : String ) : Boolean;
		
		function getAllDelegates() : Dictionary;
	}
}