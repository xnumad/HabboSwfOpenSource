package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PostMessageMessageParser implements IMessageParser
    {
        private var _groupId:int;
        private var _threadId:int;
        private var _message:MessageData;


        public function get groupId():int
        {
            return this._groupId;
        }

        public function get threadId():int
        {
            return this._threadId;
        }

        public function get message():MessageData
        {
            return this._message;
        }

        public function flush():Boolean
        {
            this._groupId = -1;
            this._threadId = -1;
            this._message = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._groupId = k.readInteger();
            this._threadId = k.readInteger();
            this._message = MessageData._Str_4933(k);
            return true;
        }
    }
}
