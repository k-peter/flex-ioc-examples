package ac.iocsample.passtheparcel.model.domain
{
	[Bindable]
	public class Parcel
	{
		[Autowire(bean="parcelContents")]
		public var contents : String;
		
		public function Parcel()
		{
			this.contents = contents;
		}

	}
}