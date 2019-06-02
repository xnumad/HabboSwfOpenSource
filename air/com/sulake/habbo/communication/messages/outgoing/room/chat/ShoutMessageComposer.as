//com.sulake.habbo.communication.messages.outgoing.room.chat.ShoutMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.chat{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ShoutMessageComposer implements IMessageComposer {

        private var _text:String;
        private var _styleId:int;

        public function ShoutMessageComposer(k:String, _arg_2:int=0);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.chat

