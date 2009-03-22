package flicc.config.dependency
{

/**
 * A dependency to be applied to an object created from an <code>
 * IObjectDescriptor</code>. 
 * 
 * <p>
 * An IDependency is responsible for supplying the <code>value</code> of the 
 * dependency, which is may be another IObjectDescriptor or reference to another
 * descriptor, and being able to <code>apply</code> the <em>resolved</em> value 
 * to an instance of an object. How this is done is left up to implementations 
 * to decide.
 * </p>
 * 
 * @see flicc.config.IObjectDescriptor#dependencies
 * 
 * @see flicc.config.dependency.PropertyDependency
 * @see flicc.config.dependency.ListDependency
 */ 
public interface IDependency 
{  
	
	/**
	 * The value to be applied to the created object. 
	 * 
	 * <p>
	 * If the value is an <code>IObjectDescriptor</code>, the object described
	 * will be fully instantiated before being passed to the <code>apply</code>
	 * method.
	 * </p>
	 * 
	 * <p>
	 * If the value is an <code>IObjectDescriptorReference</code>, then the 
	 * referenced <code>IObjectDescriptor</code> will be found and the described
	 * object created before being passed to the <code>apply</code> method. 
	 * </p>
	 * 
	 * <p>
	 * If the value is of any other type, it will not be changed before being 
	 * passed to the <code>apply</code> method.
	 * </p>
	 * 
	 * @see flicc.config.IObjectDescriptor
	 * @see flicc.config.IObjectDescriptorReference 
	 */ 
	function get value() : *; 
    
    
    /**
     * Apply <code>value</code> to the provided object <code>instance</code>.
     * 
     * <p>
     * How the value is applied on to provided object is implementation 
     * specific.
     * </p>
     * 
     * @param value The resolved value of this <code>IDependency</code>.
     * @param instance An Object instance that <code>value</code> should be
     * applied to.
     */
    function apply( value : *, instance : Object ) : void;
}

}