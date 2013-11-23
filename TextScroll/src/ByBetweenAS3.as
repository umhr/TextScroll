package  
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.tweens.ITween;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByBetweenAS3 extends Sprite 
	{
		private var _bitmapWrapper:Bitmap;
		private var _t:ITween;
		private var _speed:Number;
		public function ByBetweenAS3(speed:Number) 
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
			textField.mouseEnabled = false;
			textField.cacheAsBitmap = true;
			
			_bitmapWrapper = new Bitmap(new BitmapData(textField.width, textField.height, false, 0x00000000));
			_bitmapWrapper.bitmapData.draw(textField);
			addChild(_bitmapWrapper);
			textField = null;
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			doTween();
		}
		
		private function doTween():void 
		{
			var time:Number = (_bitmapWrapper.width + stage.stageWidth) / _speed;
			var fromX:Number =  stage.stageWidth;
			var toX:Number =  -_bitmapWrapper.width;
			
			_t = BetweenAS3.tween(_bitmapWrapper, { x: toX }, { x:fromX }, time);
			_t.stopOnComplete = false;
			_t.play();
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			if (_t != null) {
				_t.stop();
			}
			
			removeChild(_bitmapWrapper);
			_bitmapWrapper = null;
		}
		
	}
	
}