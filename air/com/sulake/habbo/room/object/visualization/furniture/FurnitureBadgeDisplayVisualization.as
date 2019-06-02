//com.sulake.habbo.room.object.visualization.furniture.FurnitureBadgeDisplayVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureBadgeDisplayVisualization extends AnimatedFurnitureVisualization {

        private static const BADGE_SPRITE_TAG:String;

        private var _badgeAssetNameNormalScale:String;
        private var _badgeAssetNameSmallScale:String;
        private var _badgeVisibleInState:int;

        public function FurnitureBadgeDisplayVisualization();

        override protected function updateModel(k:Number):Boolean;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

