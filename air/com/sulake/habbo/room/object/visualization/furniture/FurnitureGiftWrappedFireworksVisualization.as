//com.sulake.habbo.room.object.visualization.furniture.FurnitureGiftWrappedFireworksVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureGiftWrappedFireworksVisualization extends FurnitureFireworksVisualization {

        private static const PRESENT_DEFAULT_STATE:int;
        private static const MAX_PACKET_TYPE_VALUE:int;
        private static const MAX_RIBBON_TYPE_VALUE:int;

        private var _packetType:int;
        private var _ribbonType:int;
        private var _state:int;

        public function FurnitureGiftWrappedFireworksVisualization();

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        private function updateTypes():void;

        override protected function getFrameNumber(k:int, _arg_2:int):int;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;

        override protected function setAnimation(k:int):void;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

