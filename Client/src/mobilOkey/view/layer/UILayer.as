package mobilOkey.view.layer {

	import flash.display.Sprite;
	import flash.events.Event;
	
	public class UILayer extends Sprite {
		
		protected var _id:String;
		protected var _content:Sprite;
		protected var _tweened:Boolean;
		protected var _opened:Boolean = false;
		
		public function UILayer(layerId:String, content:Sprite = null, tweened:Boolean = true){
			
			_id = layerId;
			_tweened = tweened;
			
			visible = false;
			
			_content = content;
			
			if(_content){
				addChild(_content);
			}
			
			onResize();
		}
		
		public function get isOpened():Boolean{
			return _opened;
		}

		public function get id():String{
			return _id;
		}
		
		public function init():void{
			
		}
		
		public function open():void{
			
			visible = true;
			
			if(!_tweened){
				opened();
			}
		}
		
		public function close():void{
			
			_opened = false;
			
			if(!_tweened){
				closed();
			}
			
		}
		
		protected function opened(e:Event = null):void{
			_opened = true;
			dispatchEvent(new Event(Event.OPEN));
		}
		
		protected function closed(e:Event = null):void{

			
			dispatchEvent(new Event(Event.CLOSE));
			visible = false;
		}
		
		public function onResize():void{
			
		}
		
	}
}