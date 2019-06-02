//com.sulake.habbo.communication.messages.outgoing.room.engine.PetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PetMessageComposer implements IMessageComposer {

        protected var _data:Array;

        public function PetMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

