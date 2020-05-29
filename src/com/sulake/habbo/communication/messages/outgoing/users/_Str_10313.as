package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10313 implements IMessageComposer 
    {
        private var _guildId:int;

        public function _Str_10313(k:int)
        {
            this._guildId = k;
        }

        public function getMessageArray():Array
        {
            return [this._guildId];
        }

        public function dispose():void
        {
        }
    }
}
