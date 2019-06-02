//com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer

package com.sulake.habbo.communication.messages.outgoing.avatar{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class CheckUserNameMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function CheckUserNameMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.avatar

