//com.sulake.habbo.room.object.visualization.furniture.FurnitureRoomBrandingVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import starling.textures.Texture;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import com.sulake.core.runtime.events.LowMemoryEvent;
    import flash.display.BitmapData;

    public class FurnitureRoomBrandingVisualization extends FurnitureVisualization {

        private static const BRANDED_IMAGE_SPRITE_TAG:String;
        private static const OBJECT_STATE_DEFAULT:int;
        private static const OBJECT_STATE_FLIPH:int;
        private static const OBJECT_STATE_FLIPH_AND_FLIPV:int;
        private static const OBJECT_STATE_FLIPV:int;

        protected var _imageUrl:String;
        protected var _imageReady:Boolean;
        protected var _paramOffsetX:int;
        protected var _paramOffsetY:int;
        protected var _paramOffsetZ:int;
        private var _dynamicAssetName:String;
        private var _lowMemWarningApplied:Boolean;
        private var _texture:Texture;

        public function FurnitureRoomBrandingVisualization();

        override public function dispose():void;

        override protected function updateObject(k:Number, _arg_2:Number):Boolean;

        override protected function updateModel(k:Number):Boolean;

        protected function checkIfImageChanged():Boolean;

        protected function checkIfImageReady():Boolean;

        override protected function updateSpriteGPU(k:String, _arg_2:IGraphicAsset, _arg_3:IRoomObjectSprite, _arg_4:int, _arg_5:Boolean):void;

        private function onLowMemory(k:LowMemoryEvent):void;

        private function resetSprites():void;

        override protected function resetSprite(k:IRoomObjectSprite):void;

        protected function imageReady(k:BitmapData, _arg_2:String):void;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        private function checkAndCreateImageForCurrentState(k:int):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

