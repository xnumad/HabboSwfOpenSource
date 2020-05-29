package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildEditData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildEditInfoMessageParser implements IMessageParser
    {
        private var _data:GuildEditData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new GuildEditData(k);
            return true;
        }

        public function get data():GuildEditData
        {
            return this._data;
        }
    }
}
