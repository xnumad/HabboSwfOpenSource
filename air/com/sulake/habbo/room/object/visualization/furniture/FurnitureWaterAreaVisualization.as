//com.sulake.habbo.room.object.visualization.furniture.FurnitureWaterAreaVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;

    public class FurnitureWaterAreaVisualization extends AnimatedFurnitureVisualization {

        private static const SHORE_SPRITE_TAG:String;

        private var _hasSomeBorder:Boolean;
        private var _hasBorder:Array;
        private var _borderType:Array;
        private var _createdInstanceMaskSizes:Array;
        private var _needsShoreUpdate:Boolean;
        private var _sizeX:int;
        private var _sizeY:int;
        private var _shoreSpriteIndex:int;
        private var _shoreSpriteScale:int;
        private var _shoreSpriteDirection:int;
        private var _maskBitmapData:BitmapData;

        public function FurnitureWaterAreaVisualization();

        override public function dispose():void;

        override protected function updateObject(k:Number, _arg_2:Number):Boolean;

        override protected function updateAnimation(k:Number, _arg_2:Boolean=false):int;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        private function getShoreSpriteIndex(k:int):int;

        private function getShoreAsset(k:int):IGraphicAsset;

        private function getInstanceMask(k:int):IGraphicAsset;

        private function updateBorderData():void;

        private function updateTopBorder(k:Array, _arg_2:int):int;

        private function updateRightBorder(k:Array, _arg_2:int):int;

        private function updateBottomBorder(k:Array, _arg_2:int):int;

        private function updateLeftBorder(k:Array, _arg_2:int):int;

        private function resetBorders():void;

        private function getAreaData():Array;

        private function initializeShoreMasks(k:Number):Boolean;

        private function createShoreMask(k:int, _arg_2:int, _arg_3:Number):BitmapData;

        private function updateInstanceShoreMask(k:Number):Boolean;

        override protected function setAnimation(k:int):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

