package ac.iocsample.passtheparcel_hieriarchy.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	[Bindable]
	public class StartPMHierarchy extends BasePMHierarchy
	{
		
		public var middlePM : MiddlePMHierarchy;
		
		public function StartPMHierarchy()
		{
			super( "Start" );
			middlePM  = new MiddlePMHierarchy();
		}

	}
}