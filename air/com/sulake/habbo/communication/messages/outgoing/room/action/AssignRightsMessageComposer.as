//com.sulake.habbo.communication.messages.outgoing.room.action.AssignRightsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.action{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class AssignRightsMessageComposer implements IMessageComposer {

        private var _userId:int;

        public function AssignRightsMessageComposer(k:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.action

