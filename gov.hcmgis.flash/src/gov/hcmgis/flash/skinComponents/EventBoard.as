package gov.hcmgis.flash.skinComponents
{
	import spark.components.VGroup;
	import spark.primitives.Rect;
	
	public class EventBoard extends VGroup
	{
		public function EventBoard()
		{
			//TODO: implement function
			super();
		}
		public function InsertEvent():void
		{
			var ev:EventCardClass=new EventCardClass();
			ev.width=205;
			var rec:Rect=new Rect();
			rec.height=20;
			rec.width=1;
			addElement(ev);
			addElement(rec);
		}
	}
}