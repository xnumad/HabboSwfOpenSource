package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildBadgeSettings
    {
        private var _partId:int;
        private var _Str_21054:int;
        private var _position:int;

        public function GuildBadgeSettings(k:IMessageDataWrapper)
        {
            this._partId = k.readInteger();
            this._Str_21054 = k.readInteger();
            this._position = k.readInteger();
        }

        public function get _Str_1502():int
        {
            return this._partId;
        }

        public function get _Str_25271():int
        {
            return this._Str_21054;
        }

        public function get position():int
        {
            return this._position;
        }
    }
}
