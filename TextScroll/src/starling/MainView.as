package starling 
{
	import flash.display.BitmapData;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author umhr
	 */
	public class MainView extends Sprite 
	{
		private var _image:Image;
		static public var bitmapData:BitmapData;
		static public var speed:Number;
		static public var frameRate:Number;
		static public var stageWidth:int;
		static public var isInt:Boolean;
		private var _txInt:int = 0;
		private var _txNumber:Number = 0;
		public function MainView() 
		{
			super();
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
			
			_txInt = _txNumber = stageWidth;
			_image = new Image(Texture.fromBitmapData(bitmapData));
			_image.x = _txInt;
			addChild(_image);
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
		private function removedFromStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
			removeChildren();
			_image.dispose();
		}
		
		private function enterFrame(e:Event):void 
		{
			if(isInt){
				_txInt -= Math.round(speed / frameRate);
				_image.x = _txInt;
			}else {
				_txNumber -= speed / frameRate;
				_image.x = _txNumber;
			}
			if (_txInt < -_image.width || _txNumber < -_image.width) {
				_txInt = _txNumber = stageWidth;
			}
		}
	}
}
