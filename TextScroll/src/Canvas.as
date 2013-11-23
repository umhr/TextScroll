package  
{
	
	import com.bit101.components.Label;
	import com.bit101.components.NumericStepper;
	import com.bit101.components.PushButton;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.LocalConnection;
	import flash.system.Capabilities;
	import flash.ui.Keyboard;
	import net.hires.debug.Stats;
	/**
	 * ...
	 * @author umhr
	 */
	public class Canvas extends Sprite 
	{
		private var _scrollStage:Sprite = new Sprite();
		private var _statsStage:Sprite = new Sprite();
		private var _label:Label;
		private var _speed:Number = 200;
		private var _stats:Stats;
		public function Canvas() 
		{
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
			
			addChild(_scrollStage);
			addChild(_statsStage);
			
			new PushButton(this, 16, 150, "TextField.x by Enterframe", onPush).width = 200;
			new PushButton(this, 16, 175, "TextField.x int by Enterframe", onPush).width = 200;
			new PushButton(this, 16, 200, "Bitmap.x by Enterframe", onPush).width = 200;
			new PushButton(this, 16, 225, "Bitmap.x int by Enterframe", onPush).width = 200;
			new PushButton(this, 16, 250, "BitmapData.draw by Matrix", onPush).width = 200;
			new PushButton(this, 16, 275, "BitmapData.draw int by Matrix", onPush).width = 200;
			
			new PushButton(this, 16, 300, "Starling Image.x by Enterframe", onPush).width = 200;
			new PushButton(this, 16, 325, "Starling Image.x int by Enterframe", onPush).width = 200;
			//new PushButton(this, 16, 250, "by ND2D", onPush).width = 200;
			
			new PushButton(this, 232, 150, "Bitmap.x by BetweenAS3", onPush).width = 200;
			new PushButton(this, 232, 175, "Bitmap.x by Tween24", onPush).width = 200;
			new PushButton(this, 232, 200, "Bitmap.x by TweenMax", onPush).width = 200;
			new PushButton(this, 232, 225, "Bitmap.x by TweenMax useFrames", onPush).width = 200;
			new PushButton(this, 232, 250, "Bitmap.x by Tweener", onPush).width = 200;
			new PushButton(this, 232, 275, "Bitmap.x by Tweener useFrames", onPush).width = 200;
			
			new Label(this, 448, 150, "Speed:").textField.textColor = 0xFFFFFF;
			new NumericStepper(this, 498, 150, onSetSpeed).value = 200;
			new PushButton(this, 448, 175, "GarbageCollection", onGarbageCollection).width = 130;
			new PushButton(this, 448, 200, "Stats", onStats).width = 60;
			new PushButton(this, 518, 200, "EnterFrame", onEnter).width = 60;
			
			_label = new Label(this, 16, 110);
			_label.textField.textColor = 0xFFFFFF;
			
			new Label(this, 448, 325, "FlashPlayer " + Capabilities.version);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			setChild(_typeList[_typeCount]);
		}
		
		private var _typeCount:int = 0;
		private var _typeList:Array/*String*/ = [
			"TextField.x by Enterframe", "TextField.x int by Enterframe", "Bitmap.x by Enterframe", "Bitmap.x int by Enterframe",
			"BitmapData.draw by Matrix", "BitmapData.draw int by Matrix", "Starling Image.x by Enterframe", "Starling Image.x int by Enterframe",
			"Bitmap.x by BetweenAS3", "Bitmap.x by Tween24", "Bitmap.x by TweenMax", "Bitmap.x by TweenMax useFrames",
			"Bitmap.x by Tweener", "Bitmap.x by Tweener useFrames"];
			
		private function keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT || e.keyCode == Keyboard.SPACE) {
				_typeCount ++;
			}else if (e.keyCode == Keyboard.LEFT){
				_typeCount --;
			}else {
				return;
			}
			
			_typeCount += _typeList.length;
			_typeCount %= _typeList.length;
			
			setChild(_typeList[_typeCount]);
		}
		
		private function onSetSpeed(e:Event):void {
			var stepper:NumericStepper = e.target as NumericStepper;
			_speed = stepper.value;
		}
		
		private function onEnter(e:Event):void {
			if(hasEventListener(Event.ENTER_FRAME)){
				removeEventListener(Event.ENTER_FRAME, enterFrame);
			}else {
				addEventListener(Event.ENTER_FRAME, enterFrame);
			}
			if(!_enterLabel){
				_enterLabel = new Label(this, 518, 225, "0");
				_enterLabel.textField.textColor = 0xFFFFFF;
			}
		}
		private var _temp:uint = 0;
		private var _enterLabel:Label;
		private function enterFrame(e:Event):void 
		{
			_temp++;
			_enterLabel.text = String(_temp);
		}
		
		private function onGarbageCollection(e:Event):void 
		{
			// ガベージコレクションの裏技
			// http://f-site.org/articles/2011/07/31220748.html
			try {
				new LocalConnection().connect("test");
				new LocalConnection().connect("test");
			} catch (errorObject:Error) { };
		}
		
		private function onStats(e:Event):void 
		{
			if (_statsStage.numChildren == 0) {
				var stats:Stats = new Stats();
				stats.x = 448;
				stats.y = 225;
				_statsStage.addChild(stats);
			}else {
				var child:DisplayObject = _statsStage.getChildAt(0);
				_statsStage.removeChildAt(0);
				child = null;
			}
		}
		
		private function onPush(e:Event):void 
		{
			var pushButton:PushButton = e.target as PushButton;
			var label:String = pushButton.label;
			
			setChild(label);
		}
		
		private function setChild(label:String):void 
		{
			while (_scrollStage.numChildren > 0) {
				_scrollStage.removeChildAt(0);
			}
			
			switch (label) 
			{
				case "TextField.x by Enterframe":
					_scrollStage.addChild(new ByEnterFrame(_speed, false));
				break;
				case "TextField.x int by Enterframe":
					_scrollStage.addChild(new ByEnterFrame(_speed, true));
				break;
				case "Bitmap.x by Enterframe":
					_scrollStage.addChild(new ByBitmap(_speed, false));
				break;
				case "Bitmap.x int by Enterframe":
					_scrollStage.addChild(new ByBitmap(_speed, true));
				break;
				case "BitmapData.draw by Matrix":
					_scrollStage.addChild(new ByDrawMatrix(_speed, false));
				break;
				case "BitmapData.draw int by Matrix":
					_scrollStage.addChild(new ByDrawMatrix(_speed, true));
				break;
				case "Starling Image.x by Enterframe":
					_scrollStage.addChild(new ByStarling(_speed, false));
				break;
				case "Starling Image.x int by Enterframe":
					_scrollStage.addChild(new ByStarling(_speed, true));
				break;
				case "by ND2D":
					_scrollStage.addChild(new ByND2D(_speed));
				break;
				case "Bitmap.x by BetweenAS3":
					_scrollStage.addChild(new ByBetweenAS3(_speed));
				break;
				case "Bitmap.x by Tween24":
					_scrollStage.addChild(new ByTween24(_speed));
				break;
				case "Bitmap.x by TweenMax":
					_scrollStage.addChild(new ByTweenMax(_speed));
				break;
				case "Bitmap.x by TweenMax useFrames":
					_scrollStage.addChild(new ByTweenMax_useFrames(_speed));
				break;
				case "Bitmap.x by Tweener":
					_scrollStage.addChild(new ByTweener(_speed));
				break;
				case "Bitmap.x by Tweener useFrames":
					_scrollStage.addChild(new ByTweener_useFrames(_speed));
				break;
				default:
			}
			
			_label.text = label;
			
			_typeCount = _typeList.indexOf(label);
		}
	}
	
}