//com.sulake.habbo.communication.messages.outgoing.users.GetMemberGuildItemCountMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetMemberGuildItemCountMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetMemberGuildItemCountMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

