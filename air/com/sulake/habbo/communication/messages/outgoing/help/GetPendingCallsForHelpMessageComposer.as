//com.sulake.habbo.communication.messages.outgoing.help.GetPendingCallsForHelpMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetPendingCallsForHelpMessageComposer implements IMessageComposer {

        public function GetPendingCallsForHelpMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

