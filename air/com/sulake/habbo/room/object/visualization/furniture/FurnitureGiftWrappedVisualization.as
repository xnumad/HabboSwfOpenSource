//com.sulake.habbo.room.object.visualization.furniture.FurnitureGiftWrappedVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.utils.IRoomGeometry;

    public class FurnitureGiftWrappedVisualization extends FurnitureVisualization {

        private var _packetType:int;
        private var _ribbonType:int;

        public function FurnitureGiftWrappedVisualization();

        override public function update(k:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Number, _arg_6:Number):Boolean;

        private function updateTypes():void;

        override protected function getFrameNumber(k:int, _arg_2:int):int;

        override protected function getSpriteAssetName(k:int, _arg_2:int):String;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

