//com.sulake.habbo.room.object.visualization.furniture.FurnitureGuildIsometricBadgeVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.display.BitmapData;

    public class FurnitureGuildIsometricBadgeVisualization extends IsometricImageFurniVisualization {

        private static const PRIMARY_COLOUR_SPRITE_TAG:String;
        private static const SECONDARY_COLOUR_SPRITE_TAG:String;
        private static const DEFAULT_COLOR_1:int;
        private static const DEFAULT_COLOR_2:int;

        private var _color1:int;
        private var _color2:int;

        public function FurnitureGuildIsometricBadgeVisualization();

        override protected function updateModel(k:Number):Boolean;

        private function safeGetBitmapAsset(k:String):BitmapData;

        override protected function getSpriteColor(k:int, _arg_2:int, _arg_3:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

