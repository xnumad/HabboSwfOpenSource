package com.sulake.habbo.communication.messages.outgoing.room.chat
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ChatMessageComposer implements IMessageComposer
    {
        private var _text:String;
        private var _chatTrackingId:int = 0;
        private var _styleId:int = 0;

        public function ChatMessageComposer(k:String, _arg_2:int=0, _arg_3:int=-1)
        {
            this._text = k;
            this._styleId = _arg_2;
            this._chatTrackingId = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._text, this._styleId, this._chatTrackingId];
        }
    }
}
