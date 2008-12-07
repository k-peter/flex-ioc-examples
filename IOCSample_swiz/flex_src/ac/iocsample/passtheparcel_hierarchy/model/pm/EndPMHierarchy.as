package ac.iocsample.passtheparcel_hierarchy.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	[Bindable]
	public class EndPMHierarchy extends BasePMHierarchy
	{
		
		//This won't work because the pm doesn't sit on the view hierarchy
		[Autowire(bean="parcel")]
		public var parcel : Parcel;
		
		
		public function EndPMHierarchy()
		{
			super("End");
		}
		
	}
}