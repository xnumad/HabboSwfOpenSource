package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.ChatRecordData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7868 implements IMessageParser 
    {
        private var _data:ChatRecordData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new ChatRecordData(k);
            return true;
        }

        public function get data():ChatRecordData
        {
            return this._data;
        }
    }
}
