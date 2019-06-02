//com.sulake.habbo.communication.messages.outgoing.users.WelcomeGiftChangeEmailComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class WelcomeGiftChangeEmailComposer implements IMessageComposer {

        private var _newEmail:String;

        public function WelcomeGiftChangeEmailComposer(k:String);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

