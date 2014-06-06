package mobilOkey.controller.game {
	
	import mobilOkey.controller.game.states.GameStates;
	import mobilOkey.view.UI;
	
	import util.stateMachine.StateMachine;
	
	public class GameController extends StateMachine{
		
		private const  _server:String = "";
		
		private static var _instance:GameController; 
		
		
		public function GameController(){
			super();
		}
		
		public function init():void {
			
			UI.instance.init();			
			setState(GameStates.INIT);
			
		}
		
		private function onDisconnect():void{
			
		}
		
		private function onConnect():void{
			
		}
		
		public static function get instance():GameController{
			
			if(_instance){
				_instance = new GameController();
			}
			
			return _instance;
		}
	}
	
}