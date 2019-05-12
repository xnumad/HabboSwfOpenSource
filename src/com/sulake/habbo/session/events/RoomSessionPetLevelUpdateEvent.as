package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetLevelUpdateEvent extends RoomSessionEvent 
    {
        public static const RSPLUE_PET_LEVEL_UPDATE:String = "RSPLUE_PET_LEVEL_UPDATE";

        private var _petId:int;
        private var _level:int;

        public function RoomSessionPetLevelUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(RSPLUE_PET_LEVEL_UPDATE, k, _arg_4, _arg_5);
            this._petId = _arg_2;
            this._level = _arg_3;
        }

        public function get _Str_2508():int
        {
            return this._petId;
        }

        public function get level():int
        {
            return this._level;
        }
    }
}
