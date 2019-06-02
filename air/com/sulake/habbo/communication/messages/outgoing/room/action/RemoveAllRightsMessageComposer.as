//com.sulake.habbo.communication.messages.outgoing.room.action.RemoveAllRightsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class RemoveAllRightsMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function RemoveAllRightsMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

