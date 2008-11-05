package flicc.config
{
	
import flash.utils.Dictionary;

import flicc.error.FliccError;

import mx.collections.ArrayCollection;
import mx.collections.ICollectionView;

/**
 * Basic implementation of <code>IObjectFactoryConfig</code>.
 * 
 * <p>
 * Rather than create an instance <code>ObjectFactoryConfig</code> directly, it
 * is reccomended you sub class <code>MxmlFactoryConfig</code> to define a 
 * factory configuration in mxml.
 * </p>
 * 
 * @see flicc.config.mxml.MxmlFactoryConfig
 */ 
public class ObjectFactoryConfig implements IObjectFactoryConfig
{
	/**
	 * Stores all IObjectDescriptors keyed on <code>objectId</code>. 
	 */ 
	private var _descriptors : Dictionary;
	
	private var _preInstantiateSingeltons : Boolean; 
	
	public function ObjectFactoryConfig( preInstantiateSingeltons : Boolean = false)
	{
		_descriptors = new Dictionary();
		_preInstantiateSingeltons = preInstantiateSingeltons;	
	}
	
	/**
	 * @inheritDoc
	 */ 
	public function hasDescriptorForId( id : String ) : Boolean
	{
		return _descriptors.hasOwnProperty( id );	
	}
	
	/**
	 * @inheritDoc
	 */
	public function getDescriptorForId( id : String ) : IObjectDescriptor
	{
		if( hasDescriptorForId( id ) )
		{
			return IObjectDescriptor( _descriptors[ id ] );
		}
		
		throw new FliccError( "Descriptor not found for id " + id );
	}
	
	/**
	 * @inheritDoc
	 */
	public function addDescriptors( ...value ) : void
	{
		for each( var descriptor : IObjectDescriptor in value )
		{
			addDescriptor( descriptor );
		}
	}
	
	/**
	 * @inheritDoc
	 */
	public function addDescriptor( value : IObjectDescriptor ) : void
	{
		if( _descriptors.hasOwnProperty( value.objectId ) )
		{
			throw new FliccError( "Desciptor with Id : " + value.objectId + " already exists" );
		}	
	
		_descriptors[ value.objectId ] = value;
	}
	
	/**
	 * @inheritDoc
	 */
	public function getAllDescriptors() : ICollectionView
	{
		var all : ArrayCollection = new ArrayCollection();
		
		for( var descriptorId :  String in _descriptors )
		{
			all.addItem( _descriptors[ descriptorId ] );	
		}
		
		return all;	
	}
	
	/**
	 * @inheritDoc
	 */
	public function get preInstantiateSingletons() : Boolean
	{
		return _preInstantiateSingeltons;
	}
}
}