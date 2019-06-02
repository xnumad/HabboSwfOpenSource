//com.sulake.habbo.communication.messages.outgoing.room.action.KickUserMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class KickUserMessageComposer implements IMessageComposer {

        private var _userId:int;

        public function KickUserMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

