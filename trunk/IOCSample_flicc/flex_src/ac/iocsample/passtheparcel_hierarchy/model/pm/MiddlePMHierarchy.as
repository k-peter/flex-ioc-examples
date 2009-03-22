package ac.iocsample.passtheparcel_hierarchy.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	[Bindable]
	public class MiddlePMHierarchy extends BasePMHierarchy
	{
		public var endPM : EndPMHierarchy;
		
		public function MiddlePMHierarchy()
		{
			super("Middle");
			endPM = new EndPMHierarchy();
		}
		
	}
}