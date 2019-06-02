//com.sulake.habbo.communication.messages.outgoing.help.GetClientFaqsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetClientFaqsMessageComposer implements IMessageComposer {

        public function GetClientFaqsMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

