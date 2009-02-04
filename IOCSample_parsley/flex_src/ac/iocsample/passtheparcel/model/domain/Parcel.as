package ac.iocsample.passtheparcel.model.domain
{
	[Bindable]
	public class Parcel
	{
		public var contents : String;
		
		public function Parcel( contents : String )
		{
			this.contents = contents;
		}
	}
}