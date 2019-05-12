package com.sulake.habbo.communication.messages.parser.groupforums
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7217 implements IMessageParser 
    {
        private var _groupId:int;
        private var _threadId:int;
        private var _startIndex:int;
        private var _amount:int;
        private var _messages:Array;


        public function get groupId():int
        {
            return this._groupId;
        }

        public function get threadId():int
        {
            return this._threadId;
        }

        public function get startIndex():int
        {
            return this._startIndex;
        }

        public function get amount():int
        {
            return this._amount;
        }

        public function get messages():Array
        {
            return this._messages;
        }

        public function flush():Boolean
        {
            this._groupId = -1;
            this._threadId = -1;
            this._startIndex = -1;
            this._amount = -1;
            this._messages = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_3:_Str_2814;
            this._groupId = k.readInteger();
            this._threadId = k.readInteger();
            this._startIndex = k.readInteger();
            this._amount = k.readInteger();
            var _local_2:int;
            while (_local_2 < this._amount)
            {
                _local_3 = _Str_2814._Str_4933(k);
                _local_3._Str_4592 = this._groupId;
                _local_3.threadId = this._threadId;
                this._messages.push(_local_3);
                _local_2++;
            }
            return true;
        }
    }
}
