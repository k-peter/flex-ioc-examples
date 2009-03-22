package flicc.util
{
	
import flicc.config.IObjectDescriptor;
import flicc.config.IObjectDescriptorReference;
import flicc.config.dependency.IConstructorDependency;
import flicc.config.dependency.IDependency;
import flicc.config.dependency.ListDependency;
import flicc.config.dependency.PropertyDependency;

public class ConfigUtil
{
	public static function hasDependecyForProperty( property : String, 
			descriptor : IObjectDescriptor ) : Boolean {
		
		return getDependencyForProperty( property, descriptor )!=null;
	}
	
	public static function hasDependencyAtIndex( index : Number,
			descriptor :IObjectDescriptor ) : Boolean {
		
		return getDependencyAtIndex( index, descriptor )!=null;
	}
	
	public static function hasConstructorArgumentAtIndex( index : Number, 
			descriptor :IObjectDescriptor ) : Boolean {
	
		return getConstructorArgAtIndex( index, descriptor ) !=null;
	}
	
	public static function getDependencyForProperty( property : String,
		descriptor : IObjectDescriptor ) : PropertyDependency {
		
		for each( var dependency : IDependency in descriptor.dependencies )
		{
			if( dependency is PropertyDependency )
			{
				var propertyDependency : PropertyDependency = 
						PropertyDependency( dependency );
				
				if( propertyDependency.name == property )
				{
					return propertyDependency;
				}
			}
		}
		
		return null;
	}
	
	public static function getDependencyAtIndex( index : Number,
			descriptor : IObjectDescriptor ) : ListDependency {
		
		for each( var dependency : IDependency in descriptor.dependencies )
		{
			if( dependency is ListDependency )
			{
				var listDependency : ListDependency = 
						ListDependency( dependency );
				
				if( listDependency.index == index )
				{
					return listDependency;
				}
			}				
		}
		
		return null;					
	}
	
	public static function getConstructorArgAtIndex( index : Number, descriptor : IObjectDescriptor ) : IConstructorDependency
	{
		for each( var arg : IConstructorDependency in descriptor.constructorArgs )
		{
			if( arg.index == index )
				return arg;
		}	
		
		return null;
	}
	
	public static function propertyIsReferenceTo( property : String,  reference : String,
			descriptor : IObjectDescriptor ) : Boolean {
				
		var propertyDependency : PropertyDependency = 
				getDependencyForProperty( property, descriptor );
		
		if(  propertyDependency==null )
			return false;
			
		return dependencyIsReferenceTo( propertyDependency, reference );
	}
	
	public static function indexIsReferenceTo( index : Number, reference : String,
			descriptor : IObjectDescriptor ) : Boolean {
				
		return dependencyIsReferenceTo( getDependencyAtIndex( index, descriptor ), reference );
	}
	
	public static function constructorArgIsReferenceTo( index :Number, reference : String,
			descriptor : IObjectDescriptor ) : Boolean {
	
		var arg : IConstructorDependency = getConstructorArgAtIndex( index, descriptor );
		
		if( arg == null )
			return false; 
		
		if( arg.value is IObjectDescriptorReference)
		{
			var objectReference : IObjectDescriptorReference = 
					IObjectDescriptorReference( arg.value );
					
			return objectReference.objectId == reference; 
		} 	
		
		return false;
	}
	
	public static function propertyIsValue( property : String, value : Object, 
			descriptor : IObjectDescriptor ) : Boolean {
		
		return dependencyIsValue( getDependencyForProperty( property, descriptor), value );
	}
	
	public static function indexIsValue( index : Number, value : Object, 
			descriptor : IObjectDescriptor ) : Boolean {
			
		return dependencyIsValue( getDependencyAtIndex( index, descriptor ), value ); 		
	}
	
	public static function constructorArgIsValue( index : Number,  value : Object,
			descriptor :IObjectDescriptor ) : Boolean {
	
		var arg : IConstructorDependency = 
				getConstructorArgAtIndex( index, descriptor );
		
		return arg  ? arg.value == value : false;
	}
	
	public static function dependencyIsReferenceTo( dependency : IDependency, 
			reference : String ) : Boolean  {
				
		if( dependency == null )
			return false;
			 
		if( dependency.value is IObjectDescriptorReference )
		{
			var objectReference : IObjectDescriptorReference = 
					IObjectDescriptorReference( dependency.value );
					
			return objectReference.objectId == reference;	
		}
		
		return false;	
	}
	
	public static function dependencyIsValue( dependency : IDependency,
			value : Object ) : Boolean {
				
		return dependency ? dependency.value == value : false;			
	}
}

}
