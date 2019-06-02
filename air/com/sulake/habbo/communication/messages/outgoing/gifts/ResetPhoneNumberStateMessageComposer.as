//com.sulake.habbo.communication.messages.outgoing.gifts.ResetPhoneNumberStateMessageComposer

package com.sulake.habbo.communication.messages.outgoing.gifts{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class ResetPhoneNumberStateMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function ResetPhoneNumberStateMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.gifts

