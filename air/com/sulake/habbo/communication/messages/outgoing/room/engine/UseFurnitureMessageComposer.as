//com.sulake.habbo.communication.messages.outgoing.room.engine.UseFurnitureMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UseFurnitureMessageComposer implements IMessageComposer {

        private var _objectId:int;
        private var _param:int;

        public function UseFurnitureMessageComposer(k:int, _arg_2:int=0);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

