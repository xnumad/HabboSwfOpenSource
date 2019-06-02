//com.sulake.habbo.communication.messages.outgoing.poll.PollAnswerComposer

package com.sulake.habbo.communication.messages.outgoing.poll{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PollAnswerComposer implements IMessageComposer {

        private var _data:Array;

        public function PollAnswerComposer(k:int, _arg_2:int, _arg_3:Array);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.poll

