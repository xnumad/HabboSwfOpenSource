//com.sulake.habbo.communication.messages.incoming.poll.PollOfferEvent

package com.sulake.habbo.communication.messages.incoming.poll{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll.PollOfferParser;

    [SecureSWF(rename="true")]
    public class PollOfferEvent extends MessageEvent implements IMessageEvent {

        public function PollOfferEvent(k:Function);

        public function getParser():PollOfferParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.poll

