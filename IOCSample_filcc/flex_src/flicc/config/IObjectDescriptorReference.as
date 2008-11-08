package flicc.config
{

/**
 * A reference to another <code>IObjectDescriptor</code> defined within the same
 * <code>IObjectFactoryConfig</code>.
 *
 * @see flicc.dependency.IDependency#values 
 */  	
public interface IObjectDescriptorReference
{
	/**
	 * The objectId of the <code>IObjectDescriptor</code> to which this 
	 * <code>IObjectDescriptorReference</code> is referring. 
	 */
	function get objectId() : String
}

}