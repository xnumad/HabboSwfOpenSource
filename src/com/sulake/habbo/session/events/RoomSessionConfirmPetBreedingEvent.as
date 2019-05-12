package com.sulake.habbo.session.events
{
    import com.sulake.habbo.communication.messages.incoming.room.pets._Str_3763;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionConfirmPetBreedingEvent extends RoomSessionEvent 
    {
        public static const RSPFUE_CONFIRM_PET_BREEDING:String = "RSPFUE_CONFIRM_PET_BREEDING";

        private var _Str_5743:int;
        private var _pet1:_Str_3763;
        private var _pet2:_Str_3763;
        private var _Str_4447:Array;
        private var _Str_6321:int;

        public function RoomSessionConfirmPetBreedingEvent(k:IRoomSession, _arg_2:int, _arg_3:_Str_3763, _arg_4:_Str_3763, _arg_5:Array, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(RSPFUE_CONFIRM_PET_BREEDING, k, _arg_7, _arg_8);
            this._Str_5743 = _arg_2;
            this._pet1 = _arg_3;
            this._pet2 = _arg_4;
            this._Str_4447 = _arg_5;
            this._Str_6321 = _arg_6;
        }

        public function get _Str_10346():Array
        {
            return this._Str_4447;
        }

        public function get _Str_12369():int
        {
            return this._Str_5743;
        }

        public function get pet1():_Str_3763
        {
            return this._pet1;
        }

        public function get pet2():_Str_3763
        {
            return this._pet2;
        }

        public function get _Str_16867():int
        {
            return this._Str_6321;
        }
    }
}
