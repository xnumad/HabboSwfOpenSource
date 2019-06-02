//com.sulake.habbo.communication.messages.outgoing.room.avatar.SignMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SignMessageComposer implements IMessageComposer {

        private var _signID:int;

        public function SignMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.avatar

