//com.sulake.habbo.communication.messages.outgoing.room.engine.MoveObjectMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class MoveObjectMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _x:int;
        private var _y:int;
        private var _direction:int;

        public function MoveObjectMessageComposer(k:int, _arg_2:int, _arg_3:int, _arg_4:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

