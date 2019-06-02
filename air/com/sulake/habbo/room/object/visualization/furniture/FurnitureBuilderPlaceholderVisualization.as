//com.sulake.habbo.room.object.visualization.furniture.FurnitureBuilderPlaceholderVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureBuilderPlaceholderVisualization extends FurnitureVisualization {

        private var _sizeX:int;
        private var _sizeY:int;

        public function FurnitureBuilderPlaceholderVisualization();

        override protected function updateModel(k:Number):Boolean;

        private function instantiateSprites(k:Number):void;

        override protected function updateLayerCount(k:int):void;

        override protected function getAdditionalSpriteCount():int;

        override protected function getSpriteTag(k:int, _arg_2:int, _arg_3:int):String;

        override protected function getSpriteAlpha(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteMouseCapture(k:int, _arg_2:int, _arg_3:int):Boolean;

        override protected function getSpriteInk(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number;

        private function getIndex(k:int, _arg_2:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

