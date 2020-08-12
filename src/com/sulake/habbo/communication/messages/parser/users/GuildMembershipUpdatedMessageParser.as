package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.MemberData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildMembershipUpdatedMessageParser implements IMessageParser
    {
        private var _guildId:int;
        private var _data:MemberData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._guildId = k.readInteger();
            this._data = new MemberData(k);
            return true;
        }

        public function get guildId():int
        {
            return this._guildId;
        }

        public function get data():MemberData
        {
            return this._data;
        }
    }
}
