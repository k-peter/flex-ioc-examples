package com.adobe.ioc.parsley
{
   import flash.events.Event;

   public class ContextReadyEvent extends Event
   {
      public static const CONTEXT_READY_EVENT : String = "contextReadyEvent"; 
      
      public function ContextReadyEvent()
      {
         super( CONTEXT_READY_EVENT );
      }
      
      public override function clone() : Event
      {
         return new ContextReadyEvent();
      }
   }
}