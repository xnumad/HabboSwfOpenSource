//com.sulake.habbo.communication.messages.outgoing.notifications.ResetUnseenItemsComposer

package com.sulake.habbo.communication.messages.outgoing.notifications{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ResetUnseenItemsComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ResetUnseenItemsComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.notifications

