package flicc.config.mxml
{

/**
 * Defines a collection of <code>IObjectDescriptor</code>s.
 * 
 * <p>
 * The <code>MxmlObjectDesciptors</code> class is used to define collections of 
 * <code>IObjectDescriptor</code>s referenced by an <code>MxmlFactoryConfig
 * </code>s <code>externalDescriptors</code> property. An instance of <code>
 * MxmlObjectDescriptors</code> can itself refer to other instances of <code>
 * MxmlObjectDescriptors</code> through its own <code>externalDescriptors</code>
 * property and so on.
 * </p>
 * 
 * <p>
 * <code>MxmlObjectDescriptors</code> are usually defined as an mxml sub class.
 * </p>
 * 
 * @see flicc.config.mxml.MxmlFactoryConfig#externalDescriptors
 */ 	
public class MxmlObjectDescriptors
{
	/**
	 * An <code>Array</code> of <code>IObjectDescriptor</code> implementations.
	 */ 
	public var descriptors :  Array;
	
	/**
	 * An <code>Array</code> of other <code>MxmlObjectDescriptor</code> 
	 * instances. 
	 */
	public var externalDescriptors : Array;
	
	/**
	 * Get all <code>IObjectDescriptor</code>s defined by this 
	 * <code>MxmlObjectDescriptors</code>.  
	 *  
	 * @return An <code>Array</code> of all <code>IObjectDescriptor</code>s 
	 * within the <code>descriptors</code> property and all <code>
	 * IObjectDescriptors</code> from other <code>MxmlObjectDescriptors</code>
	 * instances in the <code>externalDescriptors</code> property.
	 */ 
	public function getDescriptors() : Array
	{
		if( descriptors == null )
		{
			descriptors = [];
		}
		
 		for each( var external : MxmlObjectDescriptors in externalDescriptors )
     	{
        	descriptors = descriptors.concat( external.getDescriptors() );
     	}
		
		return descriptors;
	}
}

}