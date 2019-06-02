//com.sulake.habbo.communication.messages.outgoing.poll.PollRejectComposer

package com.sulake.habbo.communication.messages.outgoing.poll{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PollRejectComposer implements IMessageComposer {

        private var _data:Array;

        public function PollRejectComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.poll

