//com.sulake.habbo.room.object.visualization.furniture.FurnitureRoomBillboardVisualization

package com.sulake.habbo.room.object.visualization.furniture{
    import com.sulake.room.object.IRoomObjectModel;

    public class FurnitureRoomBillboardVisualization extends FurnitureRoomBrandingVisualization {

        public function FurnitureRoomBillboardVisualization();

        override protected function getAdClickUrl(k:IRoomObjectModel):String;

        override protected function getSpriteXOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int;

        override protected function getSpriteZOffset(k:int, _arg_2:int, _arg_3:int):Number;


    }
}//package com.sulake.habbo.room.object.visualization.furniture

