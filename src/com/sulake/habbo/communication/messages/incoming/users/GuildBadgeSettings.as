package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildBadgeSettings
    {
        private var _partId:int;
        private var _colorId:int;
        private var _position:int;

        public function GuildBadgeSettings(k:IMessageDataWrapper)
        {
            this._partId = k.readInteger();
            this._colorId = k.readInteger();
            this._position = k.readInteger();
        }

        public function get partId():int
        {
            return this._partId;
        }

        public function get colorId():int
        {
            return this._colorId;
        }

        public function get position():int
        {
            return this._position;
        }
    }
}
