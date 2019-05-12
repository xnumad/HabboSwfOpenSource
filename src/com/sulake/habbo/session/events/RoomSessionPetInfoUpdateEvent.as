package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.RoomPetData;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetInfoUpdateEvent extends RoomSessionEvent 
    {
        public static const PET_INFO:String = "RSPIUE_PET_INFO";

        private var _petInfo:RoomPetData;

        public function RoomSessionPetInfoUpdateEvent(k:IRoomSession, _arg_2:RoomPetData, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(RoomSessionPetInfoUpdateEvent.PET_INFO, k, _arg_3, _arg_4);
            this._petInfo = _arg_2;
        }

        public function get _Str_24727():RoomPetData
        {
            return this._petInfo;
        }
    }
}
