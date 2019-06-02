//com.sulake.habbo.communication.messages.outgoing.room.chat.StartTypingMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.chat{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class StartTypingMessageComposer implements IMessageComposer {

        public function StartTypingMessageComposer();

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.chat

