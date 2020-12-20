package com.sulake.habbo.communication.messages.parser.friendlist
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FriendNotificationMessageParser implements IMessageParser
    {
        private var _typeCode:int = -1;
        private var _avatarId:String;
        private var _message:String;


        public function get typeCode():int
        {
            return this._typeCode;
        }

        public function get avatarId():String
        {
            return this._avatarId;
        }

        public function get message():String
        {
            return this._message;
        }

        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._avatarId = k.readString();
            this._typeCode = k.readInteger();
            this._message = k.readString();
            return true;
        }
    }
}
