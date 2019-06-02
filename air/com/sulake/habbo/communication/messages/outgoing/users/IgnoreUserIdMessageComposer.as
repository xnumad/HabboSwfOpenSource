//com.sulake.habbo.communication.messages.outgoing.users.IgnoreUserIdMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class IgnoreUserIdMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function IgnoreUserIdMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

