package gov.hcmgis.flash.skinComponents
{
	import gov.hcmgis.flash.skins.TimelineBoardSkin;
	
	import spark.components.VScrollBar;
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState("normal")]
	
	public class TimelineBoard extends SkinnableComponent
	{
		public function TimelineBoard()
		{
			//TODO: implement function
			super();
			setStyle("skinClass", TimelineBoardSkin);
		}
		
		[SkinPart(required="true")]
	    public var col:TimeLineColumn;
		
		[SkinPart(required="true")]
		public var leftBoard:EventBoard;
		
		[SkinPart(required="true")]
		public var rightBoard:EventBoard;
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
//			if (instance == col) {
//				textInput.editable = true; 
//				textInput.text= _text; 
//				textInput.addEventListener("change", textInput_changeHandler); 
//			}
//			
//			if (instance == closeButton) {
//				closeButton.label = "x"; 
//				closeButton.addEventListener("click", closeButton_clickHandler); 
//			}
//			if (instance == hideButton) {
//				hideButton.label = "->"; 
//				hideButton.addEventListener("click", hideButton_clickHandler); 
//			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
		}
		
		public function InsertLeftEvent():void
		{
			leftBoard.InsertEvent();
		}
		
		public function InsertRightEvent():void
		{
			rightBoard.InsertEvent();
		}
	}
}