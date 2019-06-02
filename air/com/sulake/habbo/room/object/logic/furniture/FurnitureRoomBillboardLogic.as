//com.sulake.habbo.room.object.logic.furniture.FurnitureRoomBillboardLogic

package com.sulake.habbo.room.object.logic.furniture{
    import com.sulake.room.object.IRoomObjectModelController;

    public class FurnitureRoomBillboardLogic extends FurnitureRoomBrandingLogic {

        public function FurnitureRoomBillboardLogic();

        override protected function getAdClickUrl(k:IRoomObjectModelController):String;

        override protected function handleAdClick(k:int, _arg_2:String, _arg_3:String):void;


    }
}//package com.sulake.habbo.room.object.logic.furniture

