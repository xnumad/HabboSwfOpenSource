//com.sulake.habbo.communication.messages.outgoing.room.chat.CancelTypingMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.chat{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CancelTypingMessageComposer implements IMessageComposer {

        public function CancelTypingMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.chat

