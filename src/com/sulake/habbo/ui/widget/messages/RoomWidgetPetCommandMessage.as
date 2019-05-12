package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPetCommandMessage extends RoomWidgetMessage 
    {
        public static const RWPCM_REQUEST_PET_COMMANDS:String = "RWPCM_REQUEST_PET_COMMANDS";
        public static const RWPCM_PET_COMMAND:String = "RWPCM_PET_COMMAND";
        public static const _Str_16282:int = 46;

        private var _petId:int = 0;
        private var _value:String;

        public function RoomWidgetPetCommandMessage(k:String, _arg_2:int, _arg_3:String=null)
        {
            super(k);
            this._petId = _arg_2;
            this._value = _arg_3;
        }

        public function get id():int
        {
            return this._petId;
        }

        public function get value():String
        {
            return this._value;
        }
    }
}
