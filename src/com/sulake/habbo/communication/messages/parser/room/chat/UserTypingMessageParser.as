package com.sulake.habbo.communication.messages.parser.room.chat
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserTypingMessageParser implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _isTyping:Boolean = false;


        public function get userId():int
        {
            return this._userId;
        }

        public function get isTyping():Boolean
        {
            return this._isTyping;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            this._isTyping = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._isTyping = (k.readInteger() == 1);
            return true;
        }
    }
}
