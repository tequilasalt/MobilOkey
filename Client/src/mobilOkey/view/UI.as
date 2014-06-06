package mobilOkey.view {
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mobilOkey.model.settings.Settings;
	import mobilOkey.view.layout.LayoutManager;
	
	import util.stage.StageReference;
	
	public class UI extends Sprite{
		
		private static var _instance:UI; 
		
		private var _scaleRatio:Number;
		private var _layouts:LayoutManager;
		
		public function UI(){
			super();
			
			_layouts = new LayoutManager();
			addChild(_layouts);
			
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
		
		public function get layouts():LayoutManager{
			return _layouts;
		}
		
		public static function get scaleRatioX():Number{
			return Settings.REF_WIDTH/StageReference.stage.stageWidth;
		}
		
		public static function get scaleRatioY():Number{
			return Settings.REF_HEIGHT/StageReference.stage.stageHeight;
		}
		
		public static function get aspectRatio():Number{
			return StageReference.stage.stageWidth/StageReference.stage.stageHeight;
		}
		
		public function onResize():void{			
			_layouts.onResize();
		}
		
		public static function calculateValueX(input:Number):Number{
			return input/scaleRatioX;
		}
		
		public static function calculateValueY(input:Number):Number{
			return input/scaleRatioY;
		}
		
		public static function scaleBy(obj:DisplayObject, orientX:Boolean = true):void{
			
			var w:Number;
			var h:Number;
			
			if(orientX){
				w = calculateValueX(obj.width);
				h = calculateValueX(obj.height);
			}else{
				w = calculateValueY(obj.width);
				h = calculateValueY(obj.height);
			}
			
			obj.width = w;
			obj.height = h;
			
		}
		
	}
	
}