//com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.ApplySnapshotMessageComposer

package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class ApplySnapshotMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ApplySnapshotMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents

