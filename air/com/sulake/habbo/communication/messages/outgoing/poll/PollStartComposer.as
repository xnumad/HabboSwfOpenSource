//com.sulake.habbo.communication.messages.outgoing.poll.PollStartComposer

package com.sulake.habbo.communication.messages.outgoing.poll{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PollStartComposer implements IMessageComposer {

        private var _data:Array;

        public function PollStartComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.poll

