package ac.iocsample.passtheparcel.model.pm
{
	import ac.iocsample.passtheparcel.model.domain.Parcel;
	
	[Bindable]
	public class EndPM extends BasePM
	{
		[Autowire(bean="parcel")]
		public var parcel : Parcel;
		
		public function EndPM()
		{
			super("End");
		}
		
	}
}