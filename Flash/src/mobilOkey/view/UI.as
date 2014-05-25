package mobilOkey.view {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import util.stage.StageReference;
	
	public class UI extends Sprite{
		
		private static var _instance:UI; 
		
		public function UI(){
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		public function init():void{
			StageReference.stage.addChild(this);
			StageReference.stage.addEventListener(Event.RESIZE, onResize);
		}
		
		public function addedToStage(e:Event):void{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			onResize();
		}

		public static function get instance():UI{
			
			if(!_instance){
				_instance = new UI();
			}
			
			return _instance;
		}
		
		private function onResize(e:Event = null):void{
			
			
			
		}
		
	}
	
}