package com.adobe.samplestore.model.pm
{
	import com.adobe.ac.navigation.IShowable;
	import com.adobe.samplestore.event.NavigateEvent;
	import com.adobe.samplestore.model.pm.navigation.BaseNavigator;

	public class ProductsAndCheckoutPM extends BaseNavigator
	{
		
		[MessageHandler]
		public function navigate( event : NavigateEvent ) : void
		{
			for( var i : int = 0 ; i < children.length ; i++ )
			{
				var showable : IShowable = IShowable( children.getItemAt( i ) );
				if( showable.name == event.type )
				{
					currentChild = showable;
				}
			}
		}
		
	}
}