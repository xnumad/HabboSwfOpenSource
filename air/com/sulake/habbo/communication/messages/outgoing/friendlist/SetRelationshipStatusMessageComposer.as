//com.sulake.habbo.communication.messages.outgoing.friendlist.SetRelationshipStatusMessageComposer

package com.sulake.habbo.communication.messages.outgoing.friendlist{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SetRelationshipStatusMessageComposer implements IMessageComposer {

        private var _friendId:int;
        private var _statusId:int;

        public function SetRelationshipStatusMessageComposer(k:int, _arg_2:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.friendlist

