package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.GuildEditorData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9569 implements IMessageParser 
    {
        private var _data:GuildEditorData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new GuildEditorData(k);
            return true;
        }

        public function get data():GuildEditorData
        {
            return this._data;
        }
    }
}
