//com.sulake.habbo.communication.messages.outgoing.users.GetRelationshipStatusInfoMessageComposer

package com.sulake.habbo.communication.messages.outgoing.users{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetRelationshipStatusInfoMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function GetRelationshipStatusInfoMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.users

