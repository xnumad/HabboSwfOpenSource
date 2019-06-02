//com.sulake.habbo.communication.messages.outgoing.room.action.RemoveRightsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RemoveRightsMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RemoveRightsMessageComposer(k:Array);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

