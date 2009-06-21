package com.adobe.ac.validators.event
{
   import flash.events.Event;

   public class ValidatorGroupEvent extends Event
   {
      public static const VALIDITY_CHANGE : String = "validityChange";
      public static const ENABLED_CHANGE : String = "enabledChange";
      
      public function ValidatorGroupEvent( 
         type : String, 
         bubbles : Boolean = true, 
         cancelable : Boolean = false)
      {
         //TODO: implement function
         super(type, bubbles, cancelable);
      }
      
   }
}