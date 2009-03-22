package flicc.config.mxml
{

import flicc.config.IObjectDescriptor;
import flicc.config.IObjectFactoryConfig;
import flicc.config.ObjectFactoryConfig;

import mx.collections.ICollectionView;
import mx.core.IMXMLObject;

/**
 * An <code>IObjectFactoryConfig</code> used for declaring <code>
 * ObjectDescriptor</code>s in mxml.
 * 
 * <p>
 * Creating an mxml sub-class of <code>MxmlFactoryConfig</code> is the standard
 * way of creating a factory configuration in Flicc. <code>IObjectDescriptor
 * </code>s, usually flicc.config.mxml.ObjectDescriptor, are declared on the 
 * <code>descriptors</code>property.
 * </p>
 * 
 * <p>
 * <code>IObjectDescriptor</code>s can be included from other sub-classes of 
 * <code>MxmlObjectDescriptors</code> using the <code>externalDescriptors</code> 
 * property. Note that when the configuration is initialised, all <code>
 * IObjectDescriptors</code> are considered to be "at the same level" so 
 * objectId's must be unique across all descriptors included in a single 
 * instance of <code>MxmlFactoryConfig</code>. 
 * </p>
 * 
 * @mxml
 * <pre> 
 * <?xml version="1.0" encoding="utf-8"?>
 * 	&lt;MxmlFactoryConfig xmlns="flicc.config.mxml.*"
 *	xmlns:mx="http://www.adobe.com/2006/mxml"
 *	xmlns:config="some.other.app.*"
 *	preInstantiateSingletons="true|false"&gt; 
 * 
 *  &lt;descriptors&gt;
 *		&lt;ObjectDescriptor objectId="Class1Id" clazz="{ Class1 }" /&gt;
 * 		&lt;ObjectDescriptor objectId="Class2Id" clazz="{ Class2 }" /&gt;
 * 	&lt;/descriptors&gt;
 * 
 *  &lt;externalDescriptors&gt;
 * 		<config:OtherDescriptors />
 *  &lt;/externalDescriptors&gt;
 *
 * &lt;/MxmlFactoryConfig&gt;
 * </pre>
 *
 * @see flicc.config.IObjectFactoryConfig
 * @see flicc.config.mxml.ObjectDescriptor
 * @see flicc.config.mxml.MxmlObjectDescriptors
 */
public class MxmlFactoryConfig extends MxmlObjectDescriptors 
		implements IMXMLObject, IObjectFactoryConfig {
				
	private var configImpl : ObjectFactoryConfig;
	private var _preInstantiateSingletons : Boolean = false;
		
	public function MxmlFactoryConfig()
	{
		configImpl = new ObjectFactoryConfig();	
	}
	
	/**
	 * @inheritDoc
	 */ 
	public function hasDescriptorForId( id : String ) : Boolean
	{
		return configImpl.hasDescriptorForId( id );	
	}
	
	/**
	 * @inheritDoc
	 */
	public function getDescriptorForId( id : String ) : IObjectDescriptor
	{
		return configImpl.getDescriptorForId( id );
	}
	
	/**
	 * @inheritDoc
	 */
	public function addDescriptors( ...value ) : void
	{
		configImpl.addDescriptors( value );	
	}
	
	/**
	 * @inheritDoc
	 */
	public function addDescriptor( value : IObjectDescriptor ) : void
	{ 
		configImpl.addDescriptor( value );
	}
	
	/**
	 * @inheritDoc
	 */
	public function getAllDescriptors() : ICollectionView
	{
		return configImpl.getAllDescriptors();				
	}
	
	/**
	 * @inheritDoc
	 */
	public function get preInstantiateSingletons() : Boolean
	{
		return _preInstantiateSingletons;
	}
	
	/**
	 * @private
	 */ 
	public function set preInstantiateSingletons( value : Boolean ) : void
	{
		_preInstantiateSingletons = value;
	}
	
	public function initialized( document : Object, id : String ) : void
	{
    	for each( var descriptor : IObjectDescriptor in getDescriptors() )
     	{
	    	configImpl.addDescriptor( descriptor );
     	}
	}
	
}

}