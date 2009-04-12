package com.adobe.ioc.parsley
{
   import flash.events.Event;

   public class ContextReadyEvent extends Event
   {
      private static const EVENT_NAME : String = "contextReadyEvent"; 
      
      public function ContextReadyEvent()
      {
         super( EVENT_NAME );
      }
      
      public override function clone() : Event
      {
         return new ContextReadyEvent();
      }
   }
}