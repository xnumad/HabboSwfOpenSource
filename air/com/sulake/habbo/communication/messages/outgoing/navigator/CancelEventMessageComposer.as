//com.sulake.habbo.communication.messages.outgoing.navigator.CancelEventMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CancelEventMessageComposer implements IMessageComposer {

        private var _array:Array;

        public function CancelEventMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

