package org.swizframework
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.Application;
	import mx.rpc.AsyncToken;
	import mx.utils.DescribeTypeCache;
	import mx.utils.DescribeTypeCacheRecord;
	
	import org.swizframework.events.CentralDispatcher;
	import org.swizframework.events.DynamicMediator;
	import org.swizframework.rpc.DynamicCommand;
	import org.swizframework.rpc.DynamicResponder;
	import org.swizframework.util.BeanLoader;
	import org.swizframework.util.DynamicChannelSet;
	
	public class Swiz
	{
		
		/** Swiz singleton instance */
		private static var _applicationFactory : Swiz;
		
		/** Application Controller instance */
		private var _centralDispatcher : CentralDispatcher;
		
		/** Core Swiz Events */
		public static const INIT_COMPLETE : String = "eventSwizInitComplete";
		
		/** Dictionary, references to all beans */
		private var _allBeans : Dictionary;
		
		/** Array, registry of all events */
		private var _allEventDispatchers : Dictionary;
		
		/** Dictionary, references to all mediators */
		private var _allMediators : Dictionary;
		
		/** Lock to enforce singleton */
		private static var lock : Boolean = false;
		
		/** Static getInstance method */
		public static function getInstance() : Swiz {
			if ( _applicationFactory == null) {
				lock = true;
				_applicationFactory = new Swiz();
				lock = false;
			}
			return _applicationFactory;
		}
		
		/** Static loadBeans method. */
		public static function loadBeans( beanLoaders : Array ) : void {
			getInstance().loadBeans( beanLoaders );
		}
		
		/** Static getBean method. */
		public static function getBean(beanId:String) : Object {
			return getInstance().getBean(beanId);
		}
		
		/** Static addEventListener method delegates to ApplicationController. This is for convenience */
		public static function addEventListener(type:String, listener:Function, useCapture:Boolean=false, 
												priority:int=0, useWeakReference:Boolean=false):void {
			CentralDispatcher.getInstance().addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		/** Static addEventListener method delegates to ApplicationController. This is for convenience */
		public static function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void {
			CentralDispatcher.getInstance().removeEventListener(type, listener, useCapture);
		}
		
		/** Static method to dispatch events by name. Delegates to ApplicationController */
		public static function dispatch( type : String ) : Boolean {
			return CentralDispatcher.getInstance().dispatch( type );
		}
		
		/** Static method to dispatch events by name. Delegates to ApplicationController */
		public static function dispatchEvent( event : Event ) : Boolean {
			return CentralDispatcher.getInstance().dispatchEvent( event );
		}
		
		/** Static method to execute Async calls with dynamic responders */
		public static function executeServiceCall( call : AsyncToken, resultHandler : Function,
											    faultHandler : Function = null, eventState : Object = null ) : void {
			call.addResponder( new DynamicResponder( resultHandler, faultHandler, eventState ) );
		}
		
		/** Static method to create dynamic controllers */
		public static function createCommand( delayedCall : Function, args : Array, resultHandler : Function, 
											 faultHandler : Function = null, eventState : Object = null ) : DynamicCommand {
			return new DynamicCommand( delayedCall, args, resultHandler, faultHandler, eventState );								
		}
		
		public function Swiz() {
			if ( !lock ) 
				throw new Error( "ApplicationFactory can only be defined once, if you are defining it in mxml.");
			
			_allBeans = new Dictionary();
			_allEventDispatchers = new Dictionary();
			_allMediators = new Dictionary();
			
			_centralDispatcher = CentralDispatcher.getInstance();
		}
		
		public function loadBeans( beanLoaders : Array ) : void {
			
			var classRef : Class;
			var loader : BeanLoader;
			
			// try to instanciate all loaders
			for (var i : int = 0; i<beanLoaders.length; i++) {
				trace("loading beanloader: "+i);
				classRef = beanLoaders[i];
				loader = new classRef();
				loader.registerBeans(null);
			}
			// then initialize
			initialize();
		}
		
		private function initialize() : void {
			autowireManagers();
			// autowireAllViews();
			
			// autowire the root application
			autowireObject(Application.application);
			
			// new, attach an autowire event handler to Application.application
			Application.application.systemManager.addEventListener(Event.ADDED_TO_STAGE, handleAutowireEvent, true);
			Application.application.systemManager.addEventListener(Event.REMOVED_FROM_STAGE, handleRemoveEvent, true);
			
			_centralDispatcher.dispatch( INIT_COMPLETE );
		}
		
		public function addBean( beanId : String, bean : Object ) : void {
			if ( bean is DynamicChannelSet ) {
				DynamicChannelSet(bean).createChannel();
				_allBeans[ beanId ] = bean;
			} else {
				// other random beans that implement 'SwizBean' are added loose to _all beans
				_allBeans[beanId] = bean;
			}
		}
		
		/** Get bean returns any Swiz managed bean */
		public function getBean( beanId : String ) : Object {
			if (_allBeans[ beanId ] != null) {
				return _allBeans[ beanId ];
			} else {
				throw new Error( "Bean named " + beanId + " is not defined for this application.");
			}
		}
		
		public function autowireObject( obj : Object ) : void {
			var cacheDescription : DescribeTypeCacheRecord = DescribeTypeCache.describeType( obj );
			var beanDesc : XML = cacheDescription.typeDescription;
			var variables : XMLList = beanDesc.variable;
			var accessors : XMLList = beanDesc.accessor.( @access == "readwrite" );
			var events : XMLList = beanDesc.metadata.(@name == "Event");
			var mediatedMethods : XMLList = beanDesc.method.(children().(attribute("name") == "Mediate").length() > 0);
			
			// loop over each variable xml item, checking for 'Autowire' metadata...
			resolveDependencies(obj, variables);
			// now the same for the accessors
			resolveDependencies(obj, accessors);
			
			// register a transparent handler for view dispatched events.
			resolveEvents(obj, events);
			
			// now try to find any mediator methods
			resolveMediators(obj, mediatedMethods);
		}
		
		public function autowireView( view : DisplayObject ) : void {
			// first autowire the view itself
			autowireObject(view);
			// now try all it's children, if it's a container
			/* if (view is Container) {
				for each (var child : DisplayObject in Container(view).getChildren())
					autowireView(child);
			}*/
		}
		
		public function unwireObject( obj : Object ) : void {
			var cacheDescription : DescribeTypeCacheRecord = DescribeTypeCache.describeType( obj );
			var beanDesc : XML = cacheDescription.typeDescription;
			var events : XMLList = beanDesc.metadata.(@name == "Event");
			var mediatedMethods : XMLList = beanDesc.method.(children().(attribute("name") == "Mediate").length() > 0);
			
			removeEvents(obj, events);
			removeMediators(obj, mediatedMethods);
		}
		
		private function handleAutowireEvent( e : Event ) : void {
			// trace("autowiring "+e.target);
        	var className:String = getQualifiedClassName(e.target);
       		if(className.indexOf("flash.") != 0 && className.indexOf("mx.") != 0) {
       			autowireObject(e.target);
       		}
		}
		
		private function handleRemoveEvent( e : Event ) : void {
			unwireObject(e.target);
		}

		private function autowireAllViews() : void {
			// we are going to dig through all UIComponents defined in the application looking for autowire annotations
			trace("autowiring all views...");
			// try to autowire the top level application first
			autowireObject(Application.application);
			// now dig down into each child
			for each (var child : DisplayObject in Application.application.getChildren())
				if (!(child is BeanLoader))
					autowireView(child);
		}
		
		private function autowireManagers() : void {
			// find all the annotations and wire up the managers...
			trace("autowiring managers and searching for mediators...");
			
			for each( var bean : Object in _allBeans ) {
				autowireObject(bean);
			}
		}
		
		private function resolveDependencies( obj : Object, accessorList : XMLList ) : void {
			trace("resolve dependencies - object: " + obj );
			for each (var depends : XML in accessorList) {
				if (depends.metadata != undefined && depends.metadata.( @name== "Autowire" ) != null) {
					var meta : XMLList = depends.metadata.( @name == "Autowire" );
					var propertyName : String = depends.@name;
					if ( meta.arg.( @key == "bean" ) != null && meta.arg.( @key == "bean" ).@value != undefined ) {
						// autowire by name
						var dependencyName : String = meta.arg.( @key == "bean" ).@value;
						
						if( dependencyName == "parcel" )
						{
							trace("trying to bind parcel");
						}
						
						trace("bean to wire: " + dependencyName );
						
						if ( _allBeans[ dependencyName ] != null ) {
							obj[ propertyName ] = _allBeans[ dependencyName ];
						}
					} else {
						// autowire by type?
						// trace("autowiring is not yet available by type...");
					}
				}
			}
		}
		
		private function resolveMediators( obj : Object, methodList : XMLList ) : void {
			for each (var method : XML in methodList) {
				var metadatas : XMLList = method.metadata.(@name == "Mediate");
				var methodName : String = method.@name;
				
				for each (var meta : XML in metadatas) {
					if ((meta.arg.(@key == "event") != null && meta.arg.(@key == "event").@value != undefined)) {
						var eventName : String = meta.arg.(@key == "event").@value;
						var eventProperties : String = null;
						
						if ( meta.arg.(@key == "properties") != null && meta.arg.(@key == "properties").@value != undefined ) {
						 	eventProperties = meta.arg.(@key == "properties").@value;
						}
						
						createMediator( obj, methodName, eventName, eventProperties );
					}
				}
			}
		}
				
		private function removeMediators( obj : Object, methodList : XMLList ) : void {
			for each (var method : XML in methodList) {
				var metadatas : XMLList = method.metadata.(@name == "Mediate");
				var methodName : String = method.@name;
				
				for each (var meta : XML in metadatas) {
					if ((meta.arg.(@key == "event") != null && meta.arg.(@key == "event").@value != undefined)) {
						var eventName : String = meta.arg.(@key == "event").@value;
						removeMethodMediators(eventName, obj[methodName]);
					}
				}
			}
		}
		
		private function resolveEvents(obj : Object, events : XMLList) : void {
			for each (var event : XML in events) {
				var eventName : String = event.arg.(@key == "name").@value;
				addEventDispatcher(eventName, IEventDispatcher(obj));
			}
		}
		
		private function removeEvents(obj : Object, events : XMLList) : void
		{
			for each (var event : XML in events) {
				var eventName : String = event.arg.(@key == "name").@value;
				removeEventDispatcher(eventName, IEventDispatcher(obj));
			}
		}
		
		private function addEventDispatcher(eventName : String, dispatcher : IEventDispatcher) : void {
			if (!_allEventDispatchers[eventName]) {
				_allEventDispatchers[eventName] = new Array();
			}
			
			var dispatchers : Array = _allEventDispatchers[eventName] as Array;
			dispatchers.push(dispatcher);
			
			// look for existing mediators and add as event listeners.
			for each (var eventMediators : Array in _allMediators[eventName]) {
				for each (var mediator : DynamicMediator in eventMediators) {
					trace("Adding listeners for event " + eventName + " to new dispatcher " + dispatcher + " for existing mediator " + mediator + "."); 
					dispatcher.addEventListener(eventName, mediator.respond, false, 0, true);
				}
			}
		}
		
		private function removeEventDispatcher(eventName : String, dispatcher : IEventDispatcher) : void {
			if (_allEventDispatchers[eventName]) {
				var dispatchers : Array = _allEventDispatchers[eventName] as Array;
				dispatchers.splice(dispatchers.indexOf(dispatcher, 0), 1);
			}
			
			// look for existing mediators and remove as event listeners.
			for each (var eventMediators : Array in _allMediators[eventName]) {
				for each (var mediator : DynamicMediator in eventMediators) {
					trace("Removing listeners for event " + eventName + " to new dispatcher " + dispatcher + " for existing mediator " + mediator + "."); 
					dispatcher.removeEventListener(eventName, mediator.respond, false);
				}
			}
		}
		
		private function createMediator( obj : Object, methodName : String, eventType : String, eventProperties : String ) : void {
			trace("ok, make a mediator for: "+eventType+" with method "+methodName);
			var mediator : DynamicMediator = new DynamicMediator(obj[methodName], eventProperties);
			
			addMethodMediator(eventType, obj[methodName], mediator);
		}
		
		private function addMethodMediator(eventName : String, method : Function, mediator : DynamicMediator) : void {
			if (!_allMediators[eventName]) {
				_allMediators[eventName] = new Dictionary();
			}
			
			var eventMediators : Dictionary = _allMediators[eventName] as Dictionary;
			if (!eventMediators[method]) {
				eventMediators[method] = new Array();
			}
			
			eventMediators[method].push(mediator);
			
			// listen to events dispatched through swiz.
			Swiz.addEventListener(eventName, mediator.respond);
			
			// Look for event dispatchers and add listeners for the added mediator.
			for each (var dispatcher : IEventDispatcher in _allEventDispatchers[eventName]) {
				trace("Found dispatcher " + dispatcher + " for event " + eventName + ", adding new mediator listener " + mediator.respond);
				dispatcher.addEventListener(eventName, mediator.respond);
			}
		}
		
		private function removeMethodMediators(eventName : String, method : Function) : void {
			if (_allMediators[eventName] && _allMediators[eventName][method]) {
				// Remove the swiz listener for each mediator.
				for each (var mediator : DynamicMediator in _allMediators[eventName][method]) {
					Swiz.removeEventListener(eventName, mediator.respond);
				}
				
				// Remove the dispatcher listeners from each mediator.
				for each (var dispatcher : IEventDispatcher in _allEventDispatchers[eventName]) {
					for each (var dispatcherMediator : DynamicMediator in _allMediators[eventName][method]) {
						trace("Found dispatcher " + dispatcher + " for event " + eventName + ", removing mediator listener " + mediator.respond);
						dispatcher.removeEventListener(eventName, mediator.respond);
					}
				}

				delete _allMediators[eventName][method];
			}
		}
		
		private static function addAll( dest : Dictionary, source : Dictionary ) : void {
			for (var key : String in source) {
				dest[key] = source[key];
			}
		}
	}
}