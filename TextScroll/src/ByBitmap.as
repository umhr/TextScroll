package  
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author umhr
	 */
	public class ByBitmap extends Sprite 
	{
		private var _bitmap:Bitmap;
		private var _speed:Number;
		private var _isInt:Boolean;
		private var _txInt:int = 0;
		private var _txNumber:Number = 0;
		public function ByBitmap(speed:Number, isInt:Boolean) 
		{
			_isInt = isInt;
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
			
			_txInt = _txNumber = stage.stageWidth;
			var textField:TextField = new TextField();
			textField.defaultTextFormat = new TextFormat(new IPAexm00201_DF3().fontName, 80, 0xFFFFFF);
			textField.text = "森鴎麒麟淡麗蒙殲滅懺癇謬癪爵健康優薔薇瑠璃";
			textField.embedFonts = true;
			textField.width = textField.textWidth;
			
			_bitmap = new Bitmap(new BitmapData(textField.width, textField.height, false, 0x00000000));
			_bitmap.bitmapData.draw(textField);
			_bitmap.x = _txInt;
			addChild(_bitmap);
			
			textField = null;
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			doTween();
		}
		
		private function doTween():void 
		{
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			
			removeEventListener(Event.ENTER_FRAME, enterFrame);
			removeChild(_bitmap);
			_bitmap = null;
		}
		
		private function enterFrame(e:Event):void 
		{
			if (_bitmap) {
				if(_isInt){
					_txInt -= Math.round(_speed / stage.frameRate);
					_bitmap.x = _txInt;
				}else {
					_txNumber -= _speed / stage.frameRate;
					_bitmap.x = _txNumber;
				}
				if (_txInt < -_bitmap.width || _txNumber < -_bitmap.width) {
					_txInt = _txNumber = stage.stageWidth;
				}
			}
		}
	}
	
}