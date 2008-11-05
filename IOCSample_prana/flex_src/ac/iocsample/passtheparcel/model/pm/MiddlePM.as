package ac.iocsample.passtheparcel.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	[Bindable]
	public class MiddlePM extends BasePM
	{
		public var endPM : EndPM;
		
		public function MiddlePM( parcel : Parcel )
		{
			super("Middle");
			endPM = new EndPM( parcel );
		}
		
	}
}