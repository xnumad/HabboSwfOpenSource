package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildMemberMgmtFailedMessageParser implements IMessageParser
    {
        private var _guildId:int;
        private var _reason:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._guildId = k.readInteger();
            this._reason = k.readInteger();
            return true;
        }

        public function get guildId():int
        {
            return this._guildId;
        }

        public function get reason():int
        {
            return this._reason;
        }
    }
}
