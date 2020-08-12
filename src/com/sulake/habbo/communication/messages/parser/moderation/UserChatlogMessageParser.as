package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.moderation.UserChatlogData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserChatlogMessageParser implements IMessageParser
    {
        private var _data:UserChatlogData;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._data = new UserChatlogData(k);
            return true;
        }

        public function get data():UserChatlogData
        {
            return this._data;
        }
    }
}
