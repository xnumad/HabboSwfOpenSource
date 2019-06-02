//com.sulake.habbo.communication.messages.outgoing.room.engine.PickupObjectMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PickupObjectMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _objectCategory:int;

        public function PickupObjectMessageComposer(k:int, _arg_2:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

