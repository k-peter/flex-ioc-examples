package com.adobe.ioc.parsley
{
   import mx.core.IMXMLObject;
   import mx.events.FlexEvent;
   
   import org.spicefactory.parsley.context.ApplicationContext;
   
   /**
    * The <Inject> tag supports modes of operartion:
    * 
    * 1) The first mode is intended for use within the root container of a module
    *    that must load the context first. When the context is ready it will set
    *    the 'applicationContext' property and fire the 'contextReadyEvent'. The
    *    inject tag must bind the 'applicationContext' property to the context.
    * 
    *    <login:LoginContext id="context" contextReadyEvent="createComponentsFromDescriptors()" />
    *    <context:Inject applicationContext="{ context.applicationContext }" objectId="{ LoginContext.LOGIN_CONTAINER_PM }" />
    * 
    *    Note: In the root container set <code>creationPolicy="none"</code> and only create
    *          the components when the 'contextReadyEvent' is fired.
    * 
    * 2) The first mode is intended for use after the context is ready. In this
    *    scenario we bind the context name.
    * 
    *    <context:Inject contextName="{ LoginContext.CONTEXT_NAME }" objectId="{ LoginContext.AUTHENTICATE_PANEL_PM }" />
    *  
    */
   public class Inject implements IMXMLObject
   {
      public var property : String = "mainPM";
            
      public var objectId : String;
      
      private var target : Object;
      
      private var _applicationContext : ApplicationContext;
      
      public function initialized( document : Object, id : String ) : void
      {
         target = document;
         
         document.addEventListener( FlexEvent.PREINITIALIZE, handlePreinitialize );
      }
      
      public function set contextName( name : String ) : void
      {
         _applicationContext = ApplicationContext.forName( name );
      }
      
      public function set applicationContext( context : ApplicationContext ) : void
      {
         _applicationContext = context;
         
         getObject();
      }
      
      private function handlePreinitialize( event : FlexEvent ) : void
      {
         getObject();
      }
      
      private function getObject() : void
      {
         if ( _applicationContext != null && target != null && objectId != null )
         {
            target[ property ] = _applicationContext.getObject( objectId );
         }
      }
   }
}