package com.adobe.ac.validators
{
   import flash.events.EventDispatcher;
   
   import mx.core.IMXMLObject;
   import mx.core.UIComponent;
   import mx.events.FlexEvent;
   import mx.events.ValidationResultEvent;
   import mx.validators.IValidatorListener;
   import mx.validators.Validator;

   [DefaultProperty("subscribers")]
   public class ValidatorGroupSubscriber extends EventDispatcher implements IMXMLObject
   {   
      /**
	    * This property holds the list of ValidatorGroupSubscriber.
	    *  
       * <br>It accept only elements of type ValidatorGroupSubscriber. 
       * This property is a template and should be used in MXML.
       * 
       * @see #registerForValidationEvents()
       * 
       * @example 
       *   <br>
       *   &lt;validators:ValidatorGroupSubscriber &gt; <br>
       *   &nbsp;&nbsp;&lt;validators:subscribers&gt;<br>
       *   &nbsp;&nbsp;&nbsp;&nbsp;&lt;validators:ValidatorGroupSubscriber <br>
       *   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;validator="{ model.validatorGroup.firstnameValidator }" <br>
       *   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;control="{ firstnameInput } /&gt;<br>
       *   &nbsp;&nbsp;&lt;/validators:subscribers&gt; <br>
       *   &lt;/validators:ValidatorGroupSubscriber&gt;<br>
       * 
       */
      [ArrayElementType("com.adobe.ac.validators.ValidatorSubscriber")]
      public var subscribers : Array;
      
      [Bindable]
      public var enableControlTrigger : Boolean = false; 
      
      /**
       * The ValidatorGroupSubscriber constructor.
       */
      public function ValidatorGroupSubscriber()
      {
         super();
      }
      
      /**
       * This is a Static method used to register the specified Validator with the specified listener.
       * 
       * <br>If the listener is a UIComponent it will show the error tooltip and the red border
       * as soon as the validator dispatch the INVALID event.<br>
       * The listener can be anything that implements IValidatorListener.
       * 
       * <br><br>This method can be used in ActionScript direclty. If the ValidatorGroupSubscriber 
       * is used in MXML using the subscribers template, this method is called automatically for each ValidatorSubscriber.
       * 
       * @param validator The validator to register with the listener
       * @param listener The listener. It can be anything that implements IValidatorListener
       * @param forceValidation This flag will force the validation if set to True for the specified validator after it is being registered with the listener
       * @param enableTrigger This flag will set the trigger property of the of the specified Validator if set to True
       */
      public static function registerForValidationEvents(
         validator : Validator,
         listener : EventDispatcher,
         forceValidation : Boolean = false,
         enableTrigger : Boolean = false ) : void
      {  
		   //If the listener is different from null mean the validator is already linked to a
         //listener, therefore we first reset the listener before setting the new one. 
         if( validator.listener != null )
         {
            var validationResultEvent : ValidationResultEvent = 
	            new ValidationResultEvent( ValidationResultEvent.VALID );
	            
		      IValidatorListener( validator.listener ).validationResultHandler(
               validationResultEvent );  
               
            validator.listener = null;
            validator.trigger = null;          
         }
         
         if( forceValidation )
         {
            validator.validate();
         }

         if( enableTrigger )
         {
			   validator.trigger = listener;
         }
         
			validator.listener = listener;
      }
      
      /**
       * @private 
       */
      public function initialized( document : Object, id : String ) : void
      {
         if( document is UIComponent )
         {
            UIComponent( document).addEventListener( 
               FlexEvent.CREATION_COMPLETE,
               handleDocumentCreated );
         }   
      }
      
      private function initializeSubscribers() : void
      {
         if ( subscribers != null )
         {
            for ( var i : uint = 0; i < subscribers.length; i++ )
            {
               var subscriber : ValidatorSubscriber = subscribers[ i ];
               subscribeControl( subscriber );
            }
         }
      }
      
      private function subscribeControl( subscriber : ValidatorSubscriber ) : void
      {
         registerForValidationEvents( 
            subscriber.validator,
            subscriber.listener, false, enableControlTrigger );
      }
      
      private function handleDocumentCreated( event : FlexEvent ) : void
      {
         initializeSubscribers();
      }
      
   }
}