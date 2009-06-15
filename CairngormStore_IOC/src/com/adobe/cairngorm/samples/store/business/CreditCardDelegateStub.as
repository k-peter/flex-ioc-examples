
package com.adobe.cairngorm.samples.store.business
{
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
    
	public class CreditCardDelegateStub
	{
	   private var responder : IResponder;
	   
	   public function CreditCardDelegateStub( responder : IResponder )
	   {     
	      this.responder = responder;
	   }
	   	 
	
	   public function validateCreditCard( cardholderName : String, cardNumber : String ) : void
	   {  
	   		var success : Boolean;
	   		
	   		var random : Number = Math.random() * 1;
			
			if( random > .5 )
			{
				success = true;
			}

			responder.result( 
		   			new ResultEvent( ResultEvent.RESULT, false, true, success )
		   		)
	   }
	   
	}

}
