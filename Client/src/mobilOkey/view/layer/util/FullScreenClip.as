package mobilOkey.view.layer.util {
	
	import flash.display.Sprite;
	
	import mobilOkey.controller.game.GameController;
	import mobilOkey.view.UI;
	import mobilOkey.view.layer.TransitionLayer;
	
	import util.stage.StageReference;
	
	public class FullScreenClip extends TransitionLayer {
		
		public function FullScreenClip(layerId:String, content:Sprite=null){
			super(layerId, content);
		}
		
		override public function onResize():void{
			
			var ratio:Number = _content.width/ _content.height;
			
			if(UI.aspectRatio >= ratio){
				
				_content.width = StageReference.stage.stageWidth;
				_content.scaleY = _content.scaleX;
				
			}else{
				_content.height = StageReference.stage.stageHeight;
				_content.scaleX = _content.scaleY;
			}
			
			_content.x = (GameController.instance.settings.currentWidth - _content.width)/2;
			_content.y = (GameController.instance.settings.currentHeight - _content.height)/2;
			
		}
	}
}