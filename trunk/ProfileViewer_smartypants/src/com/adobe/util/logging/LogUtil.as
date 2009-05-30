package com.adobe.util.logging
{
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.targets.TraceTarget;
	
	public class LogUtil
	{
		private static var traceTarget : TraceTarget;
		
		public static function addTraceTarget() : void 
		{
			
			traceTarget = new TraceTarget();
			traceTarget.includeCategory = true;
			traceTarget.includeLevel = true;
			Log.addTarget( traceTarget );
		}
		
		public static function getLogger( object : Object ) : ILogger 
		{
			if( traceTarget == null )
			{
				addTraceTarget();
			}
			
			var category : String = null;
			if( object is String )
			{ 
				category = object as String;
			}	
			else 
			{
				category = getQualifiedClassName( object ).replace("::",".");	
			}
			return Log.getLogger( category );
		}

	}
}