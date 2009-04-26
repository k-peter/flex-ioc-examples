package com.adobe.login.control
{

	import com.adobe.login.control.handler.Handler;
	import com.adobe.util.logging.LogUtil;
	
	import flash.events.EventDispatcher;
	
	import mx.core.UIComponent;
	
	public class SimpleController extends UIComponent
	{
		[ArrayElementType("com.adobe.login.control.ControllerPair")]
		public var controllerItems : Array;
		
		public function init() : void
		{
			LogUtil.getLogger( this ).info( "init.." );
			
			for( var i : int = 0 ; i < controllerItems.length ; i++ )
			{
				controllerItems[i].addListeners();
			}
		}	
		
	}
}