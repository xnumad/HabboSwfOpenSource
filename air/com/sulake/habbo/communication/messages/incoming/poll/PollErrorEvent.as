//com.sulake.habbo.communication.messages.incoming.poll.PollErrorEvent

package com.sulake.habbo.communication.messages.incoming.poll{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollErrorParser;

    [SecureSWF(rename="true")]
    public class PollErrorEvent extends MessageEvent implements IMessageEvent {

        public function PollErrorEvent(k:Function);

        public function getParser():PollErrorParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.poll

