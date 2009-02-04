package ac.iocsample.passtheparcel.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	[Bindable]
	public class EndPM extends BasePM
	{
		public var parcel : Parcel;
		
		public function EndPM( parcel : Parcel )
		{
			super("End");
			this.parcel = parcel;
		}
	}
}