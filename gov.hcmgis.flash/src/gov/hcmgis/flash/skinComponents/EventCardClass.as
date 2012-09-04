package gov.hcmgis.flash.skinComponents
{
	import com.htmlFilter.htmlFilter;
	import com.htmlFilter.htmlText;
	
	import flash.events.Event;
	
	import gov.hcmgis.flash.skins.EventCardSkin;
	
	import mx.core.IVisualElementContainer;
	
	import spark.components.Button;
	import spark.components.RichEditableText;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.effects.Animate;
	import spark.effects.animation.MotionPath;
	import spark.effects.animation.SimpleMotionPath;
	import spark.primitives.Rect;
	
	[SkinState("normal")]
	
	
	[Event(name="change", type="flash.events.Event")]
	public class EventCardClass extends SkinnableComponent
	{
		private var _text:String = "ModalText"; 
		private var bTextChanged:Boolean = false;
		private var _animHide:Animate;
		
		private var theHtmlFilt:htmlFilter=new htmlFilter();
		[Bindable]
		private var desc:String="";
		//private var thetext:String=_htmlFilt.filterContent("<p>This is a bulleted list</p>");
		public function EventCardClass()
		{
			//TODO: implement function
			super();
			setStyle("skinClass", EventCardSkin);
			
			_animHide=new Animate(rect);
			_animHide.duration=200;
			var splMtnPthW:SimpleMotionPath = new SimpleMotionPath();
			splMtnPthW.property="width";
			splMtnPthW.valueFrom =100;
			splMtnPthW.valueTo=0;
			var splMtnPthH:SimpleMotionPath = new SimpleMotionPath();
			splMtnPthH.property="height";
			splMtnPthH.valueFrom =100;
			splMtnPthH.valueTo=0;
			var piVec:Vector.<MotionPath> = new Vector.<MotionPath>();
			piVec.push(splMtnPthW,splMtnPthH);
			
			_animHide.motionPaths=piVec;
			
			desc=theHtmlFilt.filterContent("<p>hi</p>");
			
		}
		
		
		
		[SkinPart(required="true")]
		public var textInput:RichEditableText;
		
		[SkinPart(required="true")]
		public var rect:Rect;
		
		[SkinPart(required="false")]
		public var closeButton:Button;
		
		[SkinPart(required="false")]
		public var hideButton:Button;
		
		[SkinPart(required="false")]
		public var description:htmlText;
		
		override protected function commitProperties():void { 
			super.commitProperties(); 
			
			if (bTextChanged) { 
				bTextChanged = false; 
				textInput.text = _text; 
			} 
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			
			if (instance == textInput) {
				textInput.editable = true; 
				//textInput.text= _text; 
				textInput.addEventListener("change", textInput_changeHandler); 
				textInput.selectable=false;
				textInput.editable=false;
			}
			
			if (instance == closeButton) {
				closeButton.label = "x"; 
				closeButton.addEventListener("click", closeButton_clickHandler); 
			}
			if (instance == hideButton) {
				hideButton.label = "->"; 
				hideButton.addEventListener("click", hideButton_clickHandler); 
			}
			
			if (instance == rect) {
//				rect.label = "->"; 
//				hideButton.addEventListener("click", hideButton_clickHandler); 
			}
			if(instance==description){
				description.text=desc;
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void {
			super.partRemoved(partName, instance);
			
			if (instance == textInput) {
				textInput.removeEventListener("change", textInput_changeHandler);
			}
			
			if (instance == closeButton) {
				closeButton.removeEventListener("click", closeButton_clickHandler);
			}
			
			if (instance == closeButton) {
				hideButton.removeEventListener("click", hideButton_clickHandler);
			}
		}
		
		
		public function get text():String { 
			return textInput.text; 
		} 
		public function set text(str:String):void{
			textInput.text=str;
		}
		
		private function textInput_changeHandler(eventObj:Event):void { 
			dispatchEvent(new Event("change")); 
		}
		
		private function closeButton_clickHandler(eventObj:Event):void { 
//			textInput.editable = !textInput.editable; 
			eventObj.stopPropagation();
			IVisualElementContainer(parent).removeElement(this);
		}
		
		private function hideButton_clickHandler(eventObj:Event):void { 
			//			textInput.editable = !textInput.editable; 
//			eventObj.stopPropagation();
//			IVisualElementContainer(parent).removeElement(this);
			_animHide.play();
		}
		public function set eventDescription(descript:String):void
		{
			description.text=descript;
		}
	}
}