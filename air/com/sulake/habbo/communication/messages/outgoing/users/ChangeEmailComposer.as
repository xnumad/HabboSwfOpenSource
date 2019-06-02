//com.sulake.habbo.communication.messages.outgoing.users.ChangeEmailComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ChangeEmailComposer implements IMessageComposer {

        private var _newEmail:String;

        public function ChangeEmailComposer(k:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

