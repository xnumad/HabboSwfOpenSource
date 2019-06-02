//com.sulake.habbo.communication.messages.outgoing.room.avatar.DanceMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class DanceMessageComposer implements IMessageComposer {

        private var _style:int;

        public function DanceMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

