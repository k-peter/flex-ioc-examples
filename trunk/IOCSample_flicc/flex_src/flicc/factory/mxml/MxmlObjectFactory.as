package flicc.factory.mxml
{
	
import flicc.config.IObjectFactoryConfig;
import flicc.factory.IObjectFactory;
import flicc.factory.ObjectFactory;

[DefaultProperty("config")]

/**
 * An <code>IObjectFactory</code> for use in mxml.
 * 
 * <p>
 * The <code>MxmlObjectFactory</code> is declared and provided with an 
 * <code>IObjectFactoryConfig</code> on an mxml document. The configuration
 * is provided to the factory through the <code>config</code> property.
 * </p>
 * 
 * @mxml
 * <pre> 
 * &lt;flicc:MxmlObjectFactory id="factory">
 *		<config:FactoryConfig />		
 *  &lt;/flicc:MxmlObjectFactory&gt;
 * </pre>
 * 
 * @see flicc.
 */
public class MxmlObjectFactory implements IObjectFactory
{
	private var factoryImpl : IObjectFactory;
	
	/**
	 * The <code>IObjectFactoryConfig</code> to be used by this factory.
	 * 
	 * <p>
	 * This can only be set once and must be done before calling <code>
	 * getInstance()</code> or <code>configure()</code>.
	 * </p>  
	 */ 
	public function set config( value : IObjectFactoryConfig ) : void
	{
		if( !factoryImpl )
		{
			factoryImpl = new ObjectFactory( value );
		}
	}
	
	/**
	 * @inheritDoc
	 */ 
	public function getInstance( id : String ) : *
	{
		return factoryImpl.getInstance( id );
	}
	
	/**
	 * @inheritDoc
	 */
	public function configure( object : Object, id : String ) : void
	{
		return factoryImpl.configure( object, id );			
	}
}

}