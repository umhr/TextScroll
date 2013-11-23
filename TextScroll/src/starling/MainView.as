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
		public function MainView() 
		{
			super();
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
			
			_image = new Image(Texture.fromBitmapData(bitmapData));
			_image.x = stageWidth;
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
			_image.x -= speed / frameRate;
			if (_image.x < -_image.width) {
				_image.x = stageWidth;
			}
		}
	}
}
