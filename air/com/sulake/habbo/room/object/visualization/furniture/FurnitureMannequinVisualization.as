//com.sulake.habbo.room.object.visualization.furniture.FurnitureMannequinVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import flash.utils.Dictionary;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.habbo.avatar.IAvatarImage;

    public class FurnitureMannequinVisualization extends FurnitureVisualization implements IAvatarImageListener {

        private static const AVATAR_IMAGE_SPRITE_TAG:String;
        private static var _customPlaceholders:Dictionary;
        private static var _instanceCount:int;

        private const MANNEQUIN_BODY:String;

        private var _figure:String;
        private var _gender:String;
        private var _scale:int;
        private var _needsUpdate:Boolean;
        private var _dynamicAssetName:String;
        private var _data:AvatarFurnitureVisualizationData;
        private var _isDisposed:Boolean;

        public function FurnitureMannequinVisualization();

        public function get disposed():Boolean;

        override public function dispose():void;

        override public function initialize(k:IRoomObjectVisualizationData):Boolean;

        override protected function updateObject(k:Number, _arg_2:Number):Boolean;

        private function addAvatarAsset(k:Boolean=false):void;

        private function getCustomPlaceholder(k:int):IAvatarImage;

        override protected function updateModel(k:Number):Boolean;

        private function isAvatarAssetReady():Boolean;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        private function getAvatarAssetName():String;

        public function avatarImageReady(k:String):void;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

