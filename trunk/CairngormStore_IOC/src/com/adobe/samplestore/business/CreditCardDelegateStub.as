
package com.adobe.samplestore.business
{
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	 
	public class CreditCardDelegateStub implements ICreditCardDelegate
	{
		private var responder : IResponder;
		
		public function addResponder( responder : IResponder ) : void
		{
			this.responder = responder;
		}
		
		public function authoriseCreditCard( cardholderName : String, cardNumber : String ) : void
		{  
			var success : Boolean;
			
			var random : Number = Math.random() * 1;
			
			if( random > .5 )
			{
				success = true;
			}

			responder.result( 	new ResultEvent( ResultEvent.RESULT, false, true, success ) );
		}
		
	}

}
