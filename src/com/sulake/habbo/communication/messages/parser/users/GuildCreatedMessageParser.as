package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuildCreatedMessageParser implements IMessageParser
    {
        private var _baseRoomId:int;
        private var _groupId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._baseRoomId = k.readInteger();
            this._groupId = k.readInteger();
            return true;
        }

        public function get baseRoomId():int
        {
            return this._baseRoomId;
        }

        public function get groupId():int
        {
            return this._groupId;
        }
    }
}
