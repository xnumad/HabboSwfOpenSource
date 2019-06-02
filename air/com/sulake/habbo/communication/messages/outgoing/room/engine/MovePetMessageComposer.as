//com.sulake.habbo.communication.messages.outgoing.room.engine.MovePetMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class MovePetMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function MovePetMessageComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

