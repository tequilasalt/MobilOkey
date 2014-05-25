package {
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mobilOkey.controller.game.GameController;
	
	import util.stage.StageReference;
	
	public class Game extends Sprite {
		
		public function Game(){
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void{
			
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			StageReference.stage = stage;
			
			GameController.instance.init();
			
		}
		
	}
}