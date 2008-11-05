package flicc.config
{
	
import mx.collections.ICollectionView;

/**
 * Provides an <code>IObjectFactory</code> with </code>IObjectDescriptor
 * </code>s.
 */
public interface IObjectFactoryConfig
{
	/**
	 * Does the IObjectFactoryConfig contain a descriptor for the given
	 * objectId?
	 * 
	 * @param objectId The objectId that identifies the descriptor.
	 * @return <code>true</code> if the factory config contains a descriptor
	 * for the given objectId, false if not.
	 */
	function hasDescriptorForId( objectId : String ) : Boolean;

	/**
	 * Return the <code>IObjectDescriptor</code> for the given objectId. If
	 * the descriptor does not exist, an error will be thrown.
	 * 
	 * @param The objectId that indentifies the descriptor.
	 * @return The IObjectDescriptor instance associated with that Id.
	 */ 
	function getDescriptorForId( objectId : String ) : IObjectDescriptor;
	
	/**
	 * Gets all IObjectDescriptors in this configuration. 
	 * 
	 * @return an ICollectionView of all IObjectDescriptors that this 
	 * configuration contains.
	 */ 
	function getAllDescriptors() : ICollectionView;
	
	/**
	 * Add a single IObjectDescriptor to this configuration. The objectId
	 * of the descriptor must be unique within the context of this 
	 * configuration, or an error will be thrown.
	 * 
	 * @param value The IObjectDescriptor to add.
	 */  
	function addDescriptor( value : IObjectDescriptor ) : void;
	
	/**
	 * Add many IObjectDescriptors to this configuration.
	 * 
	 * @param value A list of IObjectDescriptors to add.
	 */ 
	function addDescriptors( ...value ) : void;
	
	/**
	 * Determines wether or not an IObjectFactory configured with this 
	 * IObjectFactoryConfig should pre-instantiate all singletons - that is
	 * all IObjectDescriptors that have the singleton property set to true.
	 * 
	 * @return true if all singletons should be preinstantiated, false if 
	 * not.
	 */ 
	function get preInstantiateSingletons() : Boolean;
}

}