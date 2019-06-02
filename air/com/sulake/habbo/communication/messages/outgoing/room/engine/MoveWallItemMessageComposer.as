//com.sulake.habbo.communication.messages.outgoing.room.engine.MoveWallItemMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class MoveWallItemMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function MoveWallItemMessageComposer(k:int, _arg_2:int, _arg_3:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

