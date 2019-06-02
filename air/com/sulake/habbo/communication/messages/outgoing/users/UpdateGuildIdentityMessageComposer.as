//com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildIdentityMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UpdateGuildIdentityMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function UpdateGuildIdentityMessageComposer(k:int, _arg_2:String, _arg_3:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

