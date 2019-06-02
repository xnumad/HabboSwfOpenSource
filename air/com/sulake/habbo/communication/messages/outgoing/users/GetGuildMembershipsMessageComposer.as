//com.sulake.habbo.communication.messages.outgoing.users.GetGuildMembershipsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGuildMembershipsMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetGuildMembershipsMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

