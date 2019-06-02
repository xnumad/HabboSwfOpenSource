//com.sulake.habbo.communication.messages.outgoing.users.GetGuildCreationInfoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGuildCreationInfoMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetGuildCreationInfoMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

