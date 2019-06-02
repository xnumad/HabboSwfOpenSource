//com.sulake.habbo.communication.messages.outgoing.room.engine.PlacePetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PlacePetMessageComposer implements IMessageComposer {

        private var _petId:int;
        private var _x:int;
        private var _y:int;

        public function PlacePetMessageComposer(k:int, _arg_2:int, _arg_3:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

