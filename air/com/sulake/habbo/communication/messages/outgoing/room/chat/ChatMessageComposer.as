//com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.chat{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ChatMessageComposer implements IMessageComposer {

        private var _text:String;
        private var _chatTrackingId:int;
        private var _styleId:int;

        public function ChatMessageComposer(k:String, _arg_2:int=0, _arg_3:int=-1);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.chat

