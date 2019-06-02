//com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer

package com.sulake.habbo.communication.messages.outgoing.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class ChangeUserNameMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function ChangeUserNameMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.avatar

