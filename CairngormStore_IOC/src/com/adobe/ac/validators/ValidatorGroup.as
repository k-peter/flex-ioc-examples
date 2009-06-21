package com.adobe.ac.validators
{
   import com.adobe.ac.validators.event.ValidatorGroupEvent;
   
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   import mx.collections.ArrayCollection;
   import mx.core.IMXMLObject;
   import mx.core.UIComponent;
   import mx.events.CollectionEvent;
   import mx.events.FlexEvent;
   import mx.events.ValidationResultEvent;
   import mx.validators.IValidatorListener;
   import mx.validators.Validator;
   
   /**
    * Dispatched when the validation changed.
    * If the <code>preValidation</code> property is <code>true</code>,
    * this event will be dispatched after the creation of the document otherwise
    * it will wait until the <code>validate()</code> method is called.
    *
    * @eventType com.adobe.ac.validators.event.ValidatorGroupEvent.VALIDITY_CHANGE
    */
   [Event(
      name="validityChange", 
      type="com.adobe.ac.validators.event.ValidatorGroupEvent")]
   
   /**
    * Dispatched when the validator group enable flag change.
    *
    * @eventType com.adobe.ac.validators.event.ValidatorGroupEvent.ENABLED_CHANGE
    */
   [Event(
      name="enabledChange", 
      type="com.adobe.ac.validators.event.ValidatorGroupEvent")]
      
   public class ValidatorGroup extends EventDispatcher implements IMXMLObject
	{
	   /**
	    * This property holds the list of ValidatorGroup.
	    *  
       * <br><br>It accept only elements of type ValidatorGroup. 
       * This property should not be used directly in ActionScript but instead use the
       * method <code>addValidatorGroup()</code> which is pushing groups indirectly in this property.
       * 
       * @see #addValidatorGroup()
       * 
       * @example 
       *   <b>// Using ActionScript</b><br>
       *   var mainGroup : ValidatorGroup = new ValidatorGroup();<br>
       *   var nestedGroup : ValidatorGroup = new ValidatorGroup();<br><br>
       * 
       *   mainGroup.addValidatorGroup( nestedGroup );<br>
       *   
       *   <br><b>// Using MXML</b><br>
       *   &lt;validators:ValidatorGroup id="mainGroup"&gt; <br>
       *   &nbsp;&nbsp;&lt;validators:groups&gt;<br>
       *   &nbsp;&nbsp;&nbsp;&nbsp;&lt;validators:ValidatorGroup id="nestedGroup" /&gt;<br>
       *   &nbsp;&nbsp;&lt;/validators:groups&gt; <br>
       *   &lt;/validators:ValidatorGroup&gt;<br>
       * 
       */
	   [ArrayElementType("com.adobe.ac.validators.ValidatorGroup")]
      public var groups : Array = new Array();
      
	   /**
	    * This property holds the list of Validator.
	    *  
       * <br><br>It accept only elements of type Validator. 
       * This property should not be used directly in ActionScript but instead use the
       * method <code>addValidator()</code> which is pushing validators indirectly in this property.
       * 
       * @see #addValidator()
       * 
       * @example 
       *   <b>// Using ActionScript</b><br>
       *   var group : ValidatorGroup = new ValidatorGroup();<br>
       *   var validator : Validator = new Validator();<br><br>
       * 
       *   group.addValidator( validator );<br>
       *   
       *   <br><b>// Using MXML</b><br>
       *   &lt;validators:ValidatorGroup id="group"&gt; <br>
       *   &nbsp;&nbsp;&lt;validators:validator&gt;<br>
       *   &nbsp;&nbsp;&nbsp;&nbsp;&lt;mx:Validator id="validator" /&gt;<br>
       *   &nbsp;&nbsp;&lt;/validators:validator&gt; <br>
       *   &lt;/validators:ValidatorGroup&gt;<br>
       * 
       */
	   [ArrayElementType("mx.validators.Validator")]
      public var validators : Array = new Array();
	   
	   /**
       * Used to pre-validate all validators and groups recursively.
       * 
       * <br>The pre-validation occurs as soon as the CREATION_COMPLETE event is dispatched in 
       * the parent document or as soon as we add programmatically validators or groups.
       * 
       * <br><br>The pre-validation process is forcing a silent validation which means that 
       * the validators will not dispatch any valid or invalid events therfore if listeners 
       * are registered to validators they will not get notified.
       *
       * If the pre-validation is enabled, the isValid property will always show the correct result 
       * according to the validators attached to the group.<br><br>
       * 
       * If the pre-validation is disabled, the isValid property will initially stay at <code>true</code>
       * until <code>validate()</code> method is called which will then 
       * force a validation and update the isValid property 
       * 
       * @see #validate()
       * 
       * @default true 
       */
	   [Bindable]
	   public var preValidation : Boolean = true;
	   
	   /**
       * This maintains a list of invalid validators and groups.
       */
	   private var invalid : ArrayCollection = new ArrayCollection();

	   private var _enabled : Boolean = true;

	   /**
       * The ValidatorGroup constructor.
       */
	   public function ValidatorGroup()
      {         
			invalid.addEventListener(
				CollectionEvent.COLLECTION_CHANGE,
				handleValidationChange );
      }
      
      /**
       * Get the current validation state of the ValidatorGroup.
       * 
       * <br><br>It will return <code>true</code> if the validation succeeded.<br>
       * It will return <code>false</code> if the validation failed.<br><br>
       * 
       * Initially after the creation the isValid property result depends on the preValidation flag.
       * 
       * @see ValidatorGroup#preValidation
       */
      [Bindable(event="validityChange")]
		public function get isValid() : Boolean
		{
			return invalid.length == 0;
		}		
		
		public function set enabled( value : Boolean ) : void
		{
		   _enabled = value;
		   
		   validate( true );
		   
		   for each( var group : ValidatorGroup in groups )
		   {
		      group.enabled = value;
		   }
		   
		   dispatchEvent( new ValidatorGroupEvent( 
		      ValidatorGroupEvent.ENABLED_CHANGE ) );
		}
		
		/**
       * Used to enable or disable the ValidatorGroup.
       * 
       * <br><br>When enabled the isValid property will reflect the current validation results.<br>
       * If enabled is false, the validator group is disabled and isValid will always return true.<br><br>
       * 
       */
		[Bindable(event="enabledChange")]
		public function get enabled() : Boolean
		{
		   return _enabled;
		}
		
		/**
       * Force the validation of all registered validators and groups.
       * 
       * @param silentValidation This parameter is used to do silent validation which 
       * will prevent the validators to trigger the errors to the listener/source.
       * 
       * @return The validation result which is equivalent to isValid.
       */
		public function validate( silentValidation : Boolean = false ) : Boolean
		{
		   invalid.removeAll();
		   
		   if( enabled )
		   {
            validateValidators( silentValidation );
            validateGroups( silentValidation );		
		   }
			   
		   return isValid;
		}
	   
	   /**
       * Reset all listeners associated with the Validators registered in the ValidatorGroup.
       * 
       * <br><br>If for example you add a TextInput as the listener of a Validator and 
       * the Validator return an invalid result, the TextInput will display a red border and an error tip.
       * By calling reset(), the TextInput listenere will be reinitialized so the red border will disappear.<br> 
       * This method is useful for example when you need to reset a form that was already used previously.
       */
	   public function reset() : void
	   {
         resetAllValidators();
         resetGroups();	      
	   }
	   
	   /**
       * Add a new Validator to the group.
       * 
       * @param validator The validator to add.
       */
		public function addValidator( validator : Validator ) : void
      {
         addValidatorEventListeners( validator );
         validators.push( validator );   
         preValidate();
      }
      
      /**
       * Remove an existing Validator from the group.
       * 
       * @param validator The validator to remove.
       */
      public function removeValidator( validator : Validator ) : void
      {
          for each( var currentValidator : Validator in validators )
         {
            if( currentValidator === validator )
            {
               removeInvalid( validator );
               validators.splice( validators.indexOf( validator ), 1 );
               
               return;
            }
         } 

         throw new Error( "Validator cannot be found." );
      }
      
      /**
       * Enable or Disable the specified Validator from the group.
       * 
       * <br><br>Using the <code>enable</code> property of the Validator directly will prevent the 
       * ValidatorGroup to notice the flag change and as a result the ValidatorGroup will not be able to update itself 
       * and show the right validation result automatically however, calling <code>ValidatorGroup.validate()</code> afterward 
       * will force the validation. Also if a control is listening to a Validator that was invalid 
       * (example: a red border is visible on the control) and at this point the Validator is disabled, 
       * the control will keep the invalid state forever until the Validator become enable again. 
       * Therefore using the enableValidator() method is recommended as it will reset the listener properly 
       * and also keep the ValidatorGroup up-to-date automatically.
       * 
       * @param validator The validator to enable or disable.
       */
      public function enableValidator( 
         validator : Validator, enabled : Boolean = true ) : void
      {
         validator.enabled = enabled;
         resetValidator( validator );
         
         validate( true );
      }
      
      /**
       * Add a new ValidatorGroup to the group.
       * 
       * @param group The validator group to add.
       */
      public function addValidatorGroup( group : ValidatorGroup ) : void
      {       
         addValidatorGroupEventListeners( group );
         groups.push( group );  
         preValidate(); 
      }
      
      /**
       * Remove an existing ValidatorGroup from the group.
       * 
       * @param group The validator group to remove.
       */
      public function removeValidatorGroup( group : ValidatorGroup ) : void
      {
          for each( var currentGroup : ValidatorGroup in groups )
         {
            if( currentGroup === group )
            {
               removeInvalid( group );
               groups.splice( groups.indexOf( group ), 1 );
               
               return;
            }
         } 
         
         throw new Error( "Group cannot be found." );
      }
      
      /**
       * @private 
       */
      public function initialized( document : Object, id : String ) : void
      {
         initializeValidators();
         initializeValidatorGroups();   
         
         if( document is UIComponent )
         {
            UIComponent( document).addEventListener( 
               FlexEvent.CREATION_COMPLETE,
               handleDocumentCreated );
         }       
      }
      
      private function addValidatorEventListeners( validator : Validator ) : void
      {
         validator.addEventListener(
            ValidationResultEvent.VALID, handleValidEvent );
         
         validator.addEventListener(
            ValidationResultEvent.INVALID, handleInvalidEvent );
      }
      
      private function addValidatorGroupEventListeners( group : ValidatorGroup ) : void
      {
         group.addEventListener(
            ValidatorGroupEvent.VALIDITY_CHANGE,
            handleValidationGroupChange );
      }
      
      private function preValidate() : void
      {
         if( preValidation )
         {
            validate( true );
         }
      }
        
      private function initializeValidators() : void
      {
         for ( var i : uint = 0; i < validators.length; i++ )
         {
            var validator : Validator = validators[ i ];
            addValidatorEventListeners( validator );
         }
      }
      
      private function initializeValidatorGroups() : void
      {
         for ( var i : uint = 0; i < groups.length; i++ )
         {
            var group : ValidatorGroup = groups[ i ];
            addValidatorGroupEventListeners( group );
         }
      }
      
		private function addInvalid( obj : Object ) : void
		{
		   if ( ! invalid.contains( obj ) )
			{
				invalid.addItem( obj );
			}
			
			dispatchEvent( new ValidatorGroupEvent( 
			   ValidatorGroupEvent.VALIDITY_CHANGE ) );
		}
		
		private function removeInvalid( obj : Object ) : void
		{
		   var index : int = invalid.getItemIndex( obj );

			if ( index >= 0 )
			{
				invalid.removeItemAt( index );
			}
			
			dispatchEvent( new ValidatorGroupEvent( 
			   ValidatorGroupEvent.VALIDITY_CHANGE ) );
		}
		
	   private function validateValidators( silentValidation : Boolean ) : void
	   {
		   for each( var validator : Validator in validators )
		   {
		      try
		      {
		         var result : ValidationResultEvent = 
		            validator.validate( null, silentValidation );
		         
               if( silentValidation && 
                   result.results && 
                   result.results.length > 0 )
               {
                  addInvalid( validator );
               }
            }
            catch( error : Error )
            {
            }		         
		   }
	   }
	   
	   private function validateGroups( silentValidation : Boolean = false ) : void
	   {
	      for each( var validatorGroup : ValidatorGroup in groups )
		   {
		      validatorGroup.validate( silentValidation );
		   }
	   }
	   
	   private function resetAllValidators() : void
	   {
		   for each( var validator : Validator in validators )
		   {
		      resetValidator( validator );
		   }
	   }
	   
	   private function resetValidator( validator : Validator ) : void
	   {
	      var validationResultEvent : ValidationResultEvent = 
	         new ValidationResultEvent( ValidationResultEvent.VALID );
	         
	      var validatorListener : IValidatorListener;
		      
	      if( validator.listener != null && 
	          validator.listener is IValidatorListener )
	      {
	         validatorListener = IValidatorListener( validator.listener );
	      }  
	      else if( validator.source != null && 
	               validator.source is IValidatorListener )
	      {
	         validatorListener = IValidatorListener( validator.source );
	      }  
	      
	      if( validatorListener )
	      {
	         validatorListener.validationResultHandler( 
	            validationResultEvent );   
	      }
	   }
	   
	   private function resetGroups() : void
	   {
		   for each( var validatorGroup : ValidatorGroup in groups )
		   {
		      validatorGroup.reset();
		   }
	   }
	   
	   private function handleDocumentCreated( event : FlexEvent ) : void
      {
         preValidate();
      }
              
      private function handleInvalidEvent(
         event : ValidationResultEvent ) : void
		{
		   if( enabled )
		   {
			   addInvalid( event.target );
			}
		}
		
		private function handleValidEvent(
		   event : ValidationResultEvent ) : void
		{
		   if( enabled )
		   {
			   removeInvalid( event.target );		
			}	
		}
		
		private function handleValidationGroupChange( event : Event ) : void
		{
		   var group : ValidatorGroup = ValidatorGroup( event.target );
		   
		   if ( group.isValid )
		   {
		      removeInvalid( group );
		   }
		   else
		   {
		      addInvalid( group );
		   }
		}
	   
	   private function handleValidationChange( event : CollectionEvent ) : void
		{
			dispatchEvent( new ValidatorGroupEvent( 
			   ValidatorGroupEvent.VALIDITY_CHANGE ) );
		}
	}
}