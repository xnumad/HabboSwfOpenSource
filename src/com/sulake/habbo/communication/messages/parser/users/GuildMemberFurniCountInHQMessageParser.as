package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildMemberFurniCountInHQMessageParser implements IMessageParser
    {
        private var _userId:int;
        private var _furniCount:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._userId = k.readInteger();
            this._furniCount = k.readInteger();
            return true;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get furniCount():int
        {
            return this._furniCount;
        }
    }
}
