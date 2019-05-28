package com.sulake.habbo.moderation
{
    public class ModActionDefinition 
    {
        public static const ALERT:int = 1;
        public static const MUTE:int = 2;
        public static const _Str_5684:int = 3;
        public static const _Str_13808:int = 4;
        public static const _Str_10699:int = 5;
        public static const MESSAGE:int = 6;

        private var _actionId:int;
        private var _name:String;
        private var _actionType:int;
        private var _sanctionTypeId:int;
        private var _actionLengthHours:int;

        public function ModActionDefinition(k:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            this._actionId = k;
            this._name = _arg_2;
            this._actionType = _arg_3;
            this._sanctionTypeId = _arg_4;
            this._actionLengthHours = _arg_5;
        }

        public function get actionId():int
        {
            return this._actionId;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get actionType():int
        {
            return this._actionType;
        }

        public function get _Str_22995():int
        {
            return this._sanctionTypeId;
        }

        public function get _Str_25670():int
        {
            return this._actionLengthHours;
        }
    }
}
