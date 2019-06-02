//com.sulake.habbo.communication.messages.incoming.poll.PollContentsEvent

package com.sulake.habbo.communication.messages.incoming.poll{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollContentsParser;

    [SecureSWF(rename="true")]
    public class PollContentsEvent extends MessageEvent implements IMessageEvent {

        public function PollContentsEvent(k:Function);

        public function getParser():PollContentsParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.poll

