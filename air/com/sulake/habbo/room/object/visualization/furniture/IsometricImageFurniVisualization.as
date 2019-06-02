//com.sulake.habbo.room.object.visualization.furniture.IsometricImageFurniVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class IsometricImageFurniVisualization extends AnimatedFurnitureVisualization {

        protected static const THUMBNAIL_SPRITE_TAG:String;

        private var _thumbnailAssetNameSmall:String;
        private var _thumbnailAssetNameNormal:String;
        private var _hasOutline:Boolean;
        private var _thumbnailImageSmall:BitmapData;
        private var _thumbnailImageNormal:BitmapData;
        private var _thumbnailDirection:int;
        private var _thumbnailChanged:Boolean;

        public function IsometricImageFurniVisualization();

        public function set hasOutline(k:Boolean):void;

        public function get hasThumbnailImage():Boolean;

        public function setThumbnailImages(k:BitmapData, _arg_2:BitmapData=null):void;

        override protected function updateModel(k:Number):Boolean;

        private function refreshThumbnail():void;

        private function addThumbnailAsset(k:BitmapData, _arg_2:int):void;

        private function generateTransformedThumbnail(k:BitmapData, _arg_2:IGraphicAsset):BitmapData;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        protected function getThumbnailAssetName(k:int):String;

        protected function getFullThumbnailAssetName(k:int, _arg_2:int):String;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

