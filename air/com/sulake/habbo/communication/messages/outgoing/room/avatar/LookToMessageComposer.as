//com.sulake.habbo.communication.messages.outgoing.room.avatar.LookToMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class LookToMessageComposer implements IMessageComposer {

        private var _locX:int;
        private var _locY:int;

        public function LookToMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

