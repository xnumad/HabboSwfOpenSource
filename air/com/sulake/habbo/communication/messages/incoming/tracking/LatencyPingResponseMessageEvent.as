//com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent

package com.sulake.habbo.communication.messages.incoming.tracking{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;

    [SecureSWF(rename="true")]
    public class LatencyPingResponseMessageEvent extends MessageEvent implements IMessageEvent {

        public function LatencyPingResponseMessageEvent(k:Function);

        public function getParser():LatencyPingResponseMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.tracking

