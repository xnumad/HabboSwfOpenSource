package com.sulake.habbo.messenger
{
    public class ChatQueueEntry 
    {
        private var _conversationId:int;
        private var _chatEntry:ChatEntry;
        private var _updateIndicator:Boolean;

        public function ChatQueueEntry(k:int, _arg_2:ChatEntry, _arg_3:Boolean)
        {
            this._conversationId = k;
            this._chatEntry = _arg_2;
            this._updateIndicator = _arg_3;
        }

        public function get _Str_20358():int
        {
            return this._conversationId;
        }

        public function get _Str_24552():ChatEntry
        {
            return this._chatEntry;
        }

        public function get _Str_24452():Boolean
        {
            return this._updateIndicator;
        }
    }
}
