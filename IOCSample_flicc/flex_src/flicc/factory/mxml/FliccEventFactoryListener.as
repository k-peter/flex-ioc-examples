package flicc.factory.mxml
{

import flicc.event.FliccEvent;
import flicc.factory.IObjectFactory;

import mx.core.UIComponent;
import mx.events.FlexEvent;

[DefaultProperty("factory")]

/**
 * Listens to FliccEvent on a component and invokes an IObectFactory.
 * 
 * <p>
 * The <code>FliccEventFactoryListener</code> is inserted at some point in 
 * the mxml component hierachy to listen for FliccEvents that have been 
 * "bubbled up" from sub components. When a <code>FliccEvent.CONFIGURE
 * </code> even ist caught, the originating component will be passed in to 
 * the <code>configure</code> method with the provided object Id.
 * </p>
 */   
public class FliccEventFactoryListener extends UIComponent
{
	public var factory : IObjectFactory;
	
	public function FliccEventFactoryListener()
	{
		addEventListener( FlexEvent.INITIALIZE, handleInitialize );
	}
	
	private function handleConfigure( event : FliccEvent ) : void
	{
		factory.configure( event.object, event.objectId );		
	}
			
	private function handleInitialize( event : FlexEvent ) : void
	{
		parent.addEventListener( FliccEvent.CONFIGURE,
				handleConfigure );
	}
}

}