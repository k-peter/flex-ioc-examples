package com.adobe.ioc.springActionscript
{
	import com.adobe.util.logging.LogUtil;
	
	import flash.events.Event;
	
	import mx.binding.utils.BindingUtils;
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	
	import org.springextensions.actionscript.context.support.XMLApplicationContext;
	
	/**
	 * it is possible to do this injection with metadata:
	 * http://www.herrodius.com/blog/158
	 * 
	 * using the inject tag for this exmample
	 */
	public class Inject implements IMXMLObject
	{
		public var property : String;
		public var objectId : String;

		private var target : Object;

		private var pendingSetters : Array = new Array();
		
		public function Inject() : void
		{		
			BindingUtils.bindSetter( contextReady, ContextLoader.loader, "isReady" );
		}
		
		private function contextReady( ready : Boolean ) : void
		{
			if( ready )
			{
				initDeferredInjections();
			}
		}
		
		public function initialized( document : Object, id : String ) : void
		{
			target = document;
			document.addEventListener( FlexEvent.PREINITIALIZE, handlePreinitialize );
		}
		
		private function handlePreinitialize( event : FlexEvent ) : void
		{
			getObject();
		}
		
		private function getObject() : void
		{
			if( !ContextLoader.isReady )
			{
				pendingSetters.push( new DeferredInjection( target, property, objectId ) );
				return;
			}
			
			if ( target != null && objectId != null )
			{
				target[ property ] = ContextLoader.applicationContext.getObject( objectId );
			}
		}
		
		private function initDeferredInjections() : void
		{
			for( var i : int = 0 ; i < pendingSetters.length ; i++ )
			{
				var injection : DeferredInjection = DeferredInjection( pendingSetters[i] );
				injection.executeInjection( ContextLoader.applicationContext );
			}
			pendingSetters = null;
		}

	}
}

import org.springextensions.actionscript.context.support.XMLApplicationContext;
	

class DeferredInjection
{
	public var target : Object;
	public var property : String;
	public var objectId : String;
	
	public function DeferredInjection( target  : Object, property : String, objectId : String )
	{
		this.target = target;
		this.property = property;
		this.objectId = objectId;
	}
	
	public function executeInjection( context : XMLApplicationContext ) : void
	{
		target[ property ] = context.getObject( objectId );
	}
}