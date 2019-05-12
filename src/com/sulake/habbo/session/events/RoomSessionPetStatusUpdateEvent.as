package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetStatusUpdateEvent extends RoomSessionEvent 
    {
        public static const RSPFUE_PET_STATUS_UPDATE:String = "RSPFUE_PET_STATUS_UPDATE";

        private var _petId:int;
        private var _canBreed:Boolean;
        private var _canHarvest:Boolean;
        private var _canRevive:Boolean;
        private var _hasBreedingPermission:Boolean;

        public function RoomSessionPetStatusUpdateEvent(k:IRoomSession, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(RSPFUE_PET_STATUS_UPDATE, k, _arg_7, _arg_8);
            this._petId = _arg_2;
            this._canBreed = _arg_3;
            this._canHarvest = _arg_4;
            this._canRevive = _arg_5;
            this._hasBreedingPermission = _arg_6;
        }

        public function get _Str_2508():int
        {
            return this._petId;
        }

        public function get _Str_2934():Boolean
        {
            return this._canBreed;
        }

        public function get _Str_3068():Boolean
        {
            return this._canHarvest;
        }

        public function get _Str_2898():Boolean
        {
            return this._canRevive;
        }

        public function get _Str_2921():Boolean
        {
            return this._hasBreedingPermission;
        }
    }
}
