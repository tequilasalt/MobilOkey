package mobilOkey.controller.game.states {
	
	import mobilOkey.controller.game.GameController;
	import mobilOkey.controller.net.SharedObjectController;
	import mobilOkey.controller.user.UserController;
	
	import util.stateMachine.AbstractState;
	
	public class InitState extends AbstractState {
		
		public function InitState(){
			super(GameStates.INIT);
		}
		
		override public function init():void{
			super.init();
			
			SharedObjectController.instance.init();
			
			if(!UserController.instance.superUser){
				GameController.instance.setState(GameStates.REGISTER);
				return;
			}
			
			GameController.instance.setState(GameStates.SET_TYPE);
		}
		
		override public function dispose():void{
			super.dispose();
		}
		
	}
}