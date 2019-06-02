//com.sulake.habbo.communication.messages.outgoing.notifications.ResetUnseenItemIdsComposer

package com.sulake.habbo.communication.messages.outgoing.notifications{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ResetUnseenItemIdsComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ResetUnseenItemIdsComposer(k:int, _arg_2:Array);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.notifications

