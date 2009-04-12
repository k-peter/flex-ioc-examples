package com.adobe.ioc.parsley
{   
   import flash.events.ErrorEvent;
   import flash.events.EventDispatcher;
   
   import org.spicefactory.lib.task.events.TaskEvent;
   import org.spicefactory.parsley.context.ApplicationContext;
   import org.spicefactory.parsley.context.ApplicationContextParser;
   import org.spicefactory.parsley.namespaces.mvc.MvcNamespaceXml;
   
   [Event(name="contextReadyEvent", type="com.adobe.ioc.parsley.ContextReadyEvent")]
   
   [Bindable]
   public class Context extends EventDispatcher
   {
      public var applicationContext : ApplicationContext;
      
      public function Context(
         contextName: String, configFile : String, root : Boolean = false )
      {
         load( contextName, configFile, root );
      }

      public static function getObject( contextName : String, id : String ) : Object
      {
         var context : ApplicationContext =
            ApplicationContext.forName( contextName );
            
         var object : Object = null;
         
         if ( context != null )
         {
            object = context.getObject( id );
         }
         
         return object;
      }

      private function load(
         contextName: String, configFile : String, root : Boolean = false ) : void
      {
         var parser : ApplicationContextParser = new ApplicationContextParser( contextName, root );
         parser.addXml( MvcNamespaceXml.config );
         parser.addFile( configFile );
         parser.addEventListener( TaskEvent.COMPLETE, handleComplete );
         parser.addEventListener( ErrorEvent.ERROR, handleError );
         parser.start();
      }
 
      private function handleComplete( event : TaskEvent ) : void
      {
         applicationContext = ApplicationContextParser( event.target ).applicationContext;
         
         dispatchEvent( new ContextReadyEvent() );
      }

      private function handleError( event : ErrorEvent ) : void
      {
         trace("Error loading context: " + event.text);
      }
   }
}