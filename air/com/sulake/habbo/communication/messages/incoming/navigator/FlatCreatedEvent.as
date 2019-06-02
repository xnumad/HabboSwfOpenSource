//com.sulake.habbo.communication.messages.incoming.navigator.FlatCreatedEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatCreatedMessageParser;

    [SecureSWF(rename="true")]
    public class FlatCreatedEvent extends MessageEvent implements IMessageEvent {

        public function FlatCreatedEvent(k:Function);

        public function getParser():FlatCreatedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

