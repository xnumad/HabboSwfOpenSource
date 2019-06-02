//com.sulake.habbo.communication.messages.outgoing.room.session.ChangeQueueMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.session{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ChangeQueueMessageComposer implements IMessageComposer {

        private var _targetQueue:int;

        public function ChangeQueueMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.session

