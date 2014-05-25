package mobilOkey.controller.game {
	
	import mobilOkey.controller.net.CommRequestController;
	
	import util.stateMachine.StateMachine;
	
	public class GameController extends StateMachine{
		
		private const  _server:String = "";
		
		private static var _instance:GameController; 
		
		
		public function GameController(){
			super();
		}
		
		public function init():void{
			
			/*UserController.instance.init(userId);
			CommRequestController.instance.connect(userId, _server);*/
			
			//CommRequestController.instance.registerMethod("onConnect", onConnect);
			//CommRequestController.instance.registerMethod("onDisconnect", onDisconnect);
			
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