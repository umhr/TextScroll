package  
{
	
	import com.greensock.easing.Linear;
	import com.greensock.TweenMax;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByTweenMax_useFrames extends Sprite 
	{
		private var _shape:Shape;
		private var _speed:Number;
		public function ByTweenMax_useFrames(speed:Number) 
		{
			_speed = speed;
			init();
		}
		private function init():void 
		{
			if (stage) onInit();
			else addEventListener(Event.ADDED_TO_STAGE, onInit);
		}

		private function onInit(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onInit);
			// entry point
			
			var textField:TextField = new TextField();
			textField.defaultTextFormat = new TextFormat(new IPAexm00201_DF3().fontName, 80, 0xFFFFFF);
			textField.text = "森鴎麒麟淡麗蒙殲滅懺癇謬癪爵健康優薔薇瑠璃";
			textField.embedFonts = true;
			textField.width = textField.textWidth;
			
			var bitmapData:BitmapData = new BitmapData(textField.width, textField.height, false, 0x00000000);
			bitmapData.draw(textField);
			
			_shape = new Shape();
			_shape.graphics.beginBitmapFill(bitmapData, null, false, true);
			_shape.graphics.drawRect(0, 0, bitmapData.width, bitmapData.height);
			_shape.graphics.endFill();
			addChild(_shape);
			
			bitmapData = null;
			textField = null;
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			doTween();
		}
		
		private function doTween():void 
		{
			var time:Number = stage.frameRate * (_shape.width + stage.stageWidth) / _speed;
			var fromX:Number =  stage.stageWidth;
			var toX:Number =  -_shape.width;
			
			TweenMax.fromTo(_shape, time, { x:fromX}, { x:toX, ease:Linear.ease, useFrames:true } ).play().repeat(-1);
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			TweenMax.killAll();
			removeChild(_shape);
			_shape = null;
		}
		
	}
	
}