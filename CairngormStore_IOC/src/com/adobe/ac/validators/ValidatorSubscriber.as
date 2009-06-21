package com.adobe.ac.validators
{
   import flash.events.EventDispatcher;
   
   import mx.validators.Validator;

   public class ValidatorSubscriber extends EventDispatcher
   {
      public var validator : Validator;
      public var listener : EventDispatcher;
      
      /**
       * The ValidatorSubscriber constructor.
       */
      public function ValidatorSubscriber()
      {
         super();
      }
      
   }
}