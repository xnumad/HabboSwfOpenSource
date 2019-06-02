//com.sulake.habbo.communication.messages.outgoing.users.UnignoreUserMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class UnignoreUserMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function UnignoreUserMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

