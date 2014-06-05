package mobilOkey.view.layer.util {
	
	import flash.display.Sprite;
	
	import mobilOkey.controller.game.GameController;
	
	public class FullScreenColor extends FullScreenClip {
		
		public function FullScreenColor(layerId:String, color:uint = 0x000000, alpha:Number = 0.5){
			
			var c:Sprite = new Sprite();
			UI.drawRect(c.graphics, GameController.instance.settings.currentWidth, GameController.instance.settings.currentHeight, color, alpha);
			
			super(layerId, c);
		}
		
	}
}