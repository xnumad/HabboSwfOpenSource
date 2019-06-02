//com.sulake.habbo.communication.messages.outgoing.room.action.LetUserInMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class LetUserInMessageComposer implements IMessageComposer {

        private var _message:Array;

        public function LetUserInMessageComposer(k:String, _arg_2:Boolean);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

