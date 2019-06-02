//com.sulake.habbo.communication.messages.outgoing.help.DeletePendingCallsForHelpMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class DeletePendingCallsForHelpMessageComposer implements IMessageComposer {

        public function DeletePendingCallsForHelpMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

