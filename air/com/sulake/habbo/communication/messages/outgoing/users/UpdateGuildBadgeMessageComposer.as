//com.sulake.habbo.communication.messages.outgoing.users.UpdateGuildBadgeMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UpdateGuildBadgeMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function UpdateGuildBadgeMessageComposer(k:int, _arg_2:Array);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

