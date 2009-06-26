
package com.adobe.samplestore.business
{
	import mx.rpc.IResponder;
	import com.adobe.cairngorm.business.ServiceLocator;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
    
	/**
	 * @version $Revision: $
	 */
	public class CreditCardDelegate
	{
	   public function CreditCardDelegate( responder : IResponder )
	   {     
	      this.service = ServiceLocator.getInstance().getRemoteObject( "creditCardService" );
	      this.responder = responder;
	   }
	   	 
	
	   public function validateCreditCard( cardholderName : String, cardNumber : String ) : void
	   {  
		   var call : Object = service.validateCreditCard( cardholderName, cardNumber );
			call.addResponder( responder );
	   }
	   
	
	   private var responder : IResponder;
	   private var service : Object;
	}

}
