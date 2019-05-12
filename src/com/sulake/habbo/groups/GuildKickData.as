package com.sulake.habbo.groups
{
    public class GuildKickData 
    {
        private var _kickTargetId:int;
        private var _kickGuildId:int;
        private var _targetBlocked:Boolean;

        public function GuildKickData(k:int, _arg_2:int, _arg_3:Boolean=false)
        {
            this._kickTargetId = k;
            this._kickGuildId = _arg_2;
            this._targetBlocked = _arg_3;
        }

        public function get _Str_25813():int
        {
            return this._kickTargetId;
        }

        public function get _Str_23057():int
        {
            return this._kickGuildId;
        }

        public function get _Str_21067():Boolean
        {
            return this._targetBlocked;
        }
    }
}
