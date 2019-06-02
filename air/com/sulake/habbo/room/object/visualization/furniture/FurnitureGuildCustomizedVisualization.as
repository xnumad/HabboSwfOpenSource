//com.sulake.habbo.room.object.visualization.furniture.FurnitureGuildCustomizedVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    public class FurnitureGuildCustomizedVisualization extends AnimatedFurnitureVisualization {

        public static const PRIMARY_COLOUR_SPRITE_TAG:String;
        public static const SECONDARY_COLOUR_SPRITE_TAG:String;
        public static const DEFAULT_COLOR_1:int;
        public static const DEFAULT_COLOR_2:int;
        private static const BADGE_SPRITE_TAG:String;

        private var _color1:int;
        private var _color2:int;
        private var _badgeAssetNameNormalScale:String;
        private var _badgeAssetNameSmallScale:String;

        public function FurnitureGuildCustomizedVisualization();

        override protected function updateModel(k:Number):Boolean;

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

