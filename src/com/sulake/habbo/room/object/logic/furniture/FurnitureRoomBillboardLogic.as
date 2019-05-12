package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;

    public class FurnitureRoomBillboardLogic extends FurnitureRoomBrandingLogic 
    {
        public function FurnitureRoomBillboardLogic()
        {
            _Str_12652 = true;
        }

        override protected function getAdClickUrl(k:IRoomObjectModelController):String
        {
            return k.getString(RoomObjectVariableEnum.FURNITURE_BRANDING_URL);
        }

        override protected function handleAdClick(k:int, _arg_2:String, _arg_3:String):void
        {
            if (_arg_3.indexOf("http") == 0)
            {
                HabboWebTools.openWebPage(_arg_3);
            }
            else
            {
                if (eventDispatcher != null)
                {
                    eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.RORAE_ROOM_AD_FURNI_CLICK, object, "", _arg_3));
                }
            }
        }
    }
}
