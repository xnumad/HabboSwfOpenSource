//com.sulake.habbo.communication.messages.outgoing.room.engine.RemoveItemMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class RemoveItemMessageComposer implements IMessageComposer {

        private var _objectId:int;

        public function RemoveItemMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

