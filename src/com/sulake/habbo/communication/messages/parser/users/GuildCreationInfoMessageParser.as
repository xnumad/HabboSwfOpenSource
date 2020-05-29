package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildCreationData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildCreationInfoMessageParser implements IMessageParser
    {
        private var _data:GuildCreationData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new GuildCreationData(k);
            return true;
        }

        public function get data():GuildCreationData
        {
            return this._data;
        }
    }
}
