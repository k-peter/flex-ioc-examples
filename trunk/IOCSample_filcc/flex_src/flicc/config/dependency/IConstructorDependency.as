package flicc.config.dependency
{

/**
 * Describes a single constructor argument to be passsed to an object created 
 * from an <code>IObjectDescriptor</code>.
 * 
 * <p>
 * An <code>IConstructorDependency</code> works differently from an <code>
 * IDependency</code> in that the IConstructorDependency is not asked to 
 * <i>apply</i> its value on to an object, but simply provide the <code>value
 * </code> and the <code>index</code> the value should be applied at.  
 * </p>
 * 
 * @see flicc.config.IObjectDescriptor#consturctorArgs
 */ 
public interface IConstructorDependency
{  
	/**
	 * The value to be passed. 
	 * 
	 * <p>
	 * This follows the same resolution rules as the <code>value</code> from 
	 * <code>IDependency</code>.
	 * </p>
	 * 
	 * @see flicc.config.dependency.IDependency#value
	 */ 
	function get value() : Object; 

	/**
	 * The 0 based position in the constructor arguments list that the resolved
	 * <code>value</code> should be passed. 
	 */ 
	function get index() : Number;
}

}