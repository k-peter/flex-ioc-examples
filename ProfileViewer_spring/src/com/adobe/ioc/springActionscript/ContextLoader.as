package com.adobe.ioc.springActionscript
{
	import com.adobe.util.logging.LogUtil;
	
	import flash.events.Event;
	
	import org.springextensions.actionscript.context.support.XMLApplicationContext;
	
	public class ContextLoader
	{
		public static var applicationContext : XMLApplicationContext;
		public static var loader : Loader = new Loader();

		private static var _contextPath : String;
		
		private static function handleLoadComplete( event : Event ) : void
		{
			LogUtil.getLogger( "context" ).info( "load complete" );
			loader.isReady = true;
		}
		
		public static function get isReady() : Boolean 
		{
			return loader.isReady;
		}
		
		public static function set contextPath( value : String ) : void
		{
			_contextPath = value;
			applicationContext = new XMLApplicationContext( _contextPath );
			applicationContext.addEventListener(Event.COMPLETE, handleLoadComplete );
			applicationContext.load();
		}

	}
}