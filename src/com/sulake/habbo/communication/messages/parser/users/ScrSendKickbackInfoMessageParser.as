package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.users.ScrKickbackData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ScrSendKickbackInfoMessageParser implements IMessageParser
    {
        private var _data:ScrKickbackData;


        public function flush():Boolean
        {
            this._data = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new ScrKickbackData(k);
            return true;
        }

        public function get data():ScrKickbackData
        {
            return this._data;
        }
    }
}
