package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildMembershipRejectedMessageParser implements IMessageParser
    {
        private var _guildId:int;
        private var _userId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._guildId = k.readInteger();
            this._userId = k.readInteger();
            return true;
        }

        public function get guildId():int
        {
            return this._guildId;
        }

        public function get userId():int
        {
            return this._userId;
        }
    }
}
