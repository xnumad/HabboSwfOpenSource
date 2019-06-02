//com.sulake.habbo.communication.messages.outgoing.room.chat.WhisperMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.chat{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class WhisperMessageComposer implements IMessageComposer {

        private var _text:String;
        private var _recipientName:String;
        private var _styleId:int;

        public function WhisperMessageComposer(k:String, _arg_2:String, _arg_3:int=0);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.chat

