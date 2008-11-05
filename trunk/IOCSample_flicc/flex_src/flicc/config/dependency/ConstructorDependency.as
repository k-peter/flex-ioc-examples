package flicc.config.dependency
{
  
import flicc.error.FliccError;

/**
 * Basic implementation of <code>IConstructorDependency</code>.
 * 
 * <p>
 * Note that if you are using the <code>ListDescriptor</code> or <code>
 * ObjectDescriptor</code> classes, you do not need to explicitly create <code>
 * ConstructorDependency</code> instances.
 * </p>
 * 
 * @see flicc.config.mxml.BaseMxmlObjectDescriptor#constructorArgs 
 */  
public class ConstructorDependency implements IConstructorDependency
{      
	private var _index : Number;
	private var _value : Object;
      
    /**
     * Create a new ConstructorDependency.
     * 
     * @param index The 0-based order the argumemt should be passed to the 
     * target objects constructor.
     * 
     * @value The value to be passed
     */   
	public function ConstructorDependency( index : Number,  value : Object ) : void
	{
		this._index = index;
		this._value = value;
	}
    
    /**
     * @inheritDoc
     */   
	public function get value() : Object
	{
		return _value;
	}
    
    
    /**
     * @inheritDoc
     */   
	public function get index() : Number
	{
		return _index;
	}
}

}