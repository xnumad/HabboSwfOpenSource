package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildMemberData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9168 implements IMessageParser 
    {
        private var _data:GuildMemberData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new GuildMemberData(k);
            return true;
        }

        public function get data():GuildMemberData
        {
            return this._data;
        }
    }
}
