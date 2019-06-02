//com.sulake.habbo.communication.messages.outgoing.room.engine.MoveAvatarMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.engine{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class MoveAvatarMessageComposer implements IMessageComposer {

        private var _x:int;
        private var _y:int;

        public function MoveAvatarMessageComposer(k:int, _arg_2:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.engine

