package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomInviteMessageParser implements IMessageParser
    {
        private var _senderId:int;
        private var _messageText:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._senderId = k.readInteger();
            this._messageText = k.readString();
            return true;
        }

        public function get senderId():int
        {
            return this._senderId;
        }

        public function get _Str_3460():String
        {
            return this._messageText;
        }
    }
}
