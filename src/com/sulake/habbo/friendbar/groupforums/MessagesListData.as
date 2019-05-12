package com.sulake.habbo.friendbar.groupforums
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_2814;

    public class MessagesListData 
    {
        private var _threadId:int;
        private var _startIndex:int;
        private var _totalMessages:int;
        private var _messages:Array;
        private var _messagesById:Dictionary;

        public function MessagesListData(k:int, _arg_2:int, _arg_3:int, _arg_4:Array):void
        {
            var _local_6:_Str_2814;
            super();
            this._threadId = k;
            this._startIndex = _arg_3;
            this._totalMessages = _arg_2;
            this._messages = _arg_4;
            this._messagesById = new Dictionary();
            var _local_5:int;
            while (_local_5 < _arg_4.length)
            {
                _local_6 = _arg_4[_local_5];
                this._messagesById[_local_6.messageId] = _local_6;
                _local_5++;
            }
        }

        public function get threadId():int
        {
            return this._threadId;
        }

        public function get startIndex():int
        {
            return this._startIndex;
        }

        public function get _Str_8598():int
        {
            return this._totalMessages;
        }

        public function get messages():Array
        {
            return this._messages;
        }

        public function get _Str_22993():Dictionary
        {
            return this._messagesById;
        }

        public function get size():int
        {
            return this._messages.length;
        }
    }
}
