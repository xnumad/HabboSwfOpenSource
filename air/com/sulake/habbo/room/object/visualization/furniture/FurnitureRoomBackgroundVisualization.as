//com.sulake.habbo.room.object.visualization.furniture.FurnitureRoomBackgroundVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import flash.utils.Dictionary;
    import flash.display.BitmapData;

    public class FurnitureRoomBackgroundVisualization extends FurnitureRoomBrandingVisualization {

        private var _imageOffsets:Dictionary;

        public function FurnitureRoomBackgroundVisualization();

        override public function dispose():void;

        override protected function imageReady(k:BitmapData, _arg_2:String):void;

        private function addDirectionalOffsets(k:int, _arg_2:int, _arg_3:int):void;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number;

        override protected function getSpriteMouseCapture(k:int, _arg_2:int, _arg_3:int):Boolean;

        private function getScaledOffset(k:int, _arg_2:int):Number;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

