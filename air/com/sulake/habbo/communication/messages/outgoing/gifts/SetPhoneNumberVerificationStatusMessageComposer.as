//com.sulake.habbo.communication.messages.outgoing.gifts.SetPhoneNumberVerificationStatusMessageComposer

package com.sulake.habbo.communication.messages.outgoing.gifts{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class SetPhoneNumberVerificationStatusMessageComposer implements IMessageComposer, IDisposable {

        public static const NO_ISSUE_ID:int;

        private var _array:Array;

        public function SetPhoneNumberVerificationStatusMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.gifts

