package ac.iocsample.passtheparcel.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	[Bindable]
	public class StartPM extends BasePM
	{
		public var middlePM : MiddlePM;
		
		public function StartPM( parcel : Parcel )
		{
			super( "Start" );
			middlePM = new MiddlePM( parcel );
		}

	}
}