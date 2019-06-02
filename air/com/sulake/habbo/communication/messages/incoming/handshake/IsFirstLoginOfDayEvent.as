//com.sulake.habbo.communication.messages.incoming.handshake.IsFirstLoginOfDayEvent

package com.sulake.habbo.communication.messages.incoming.handshake{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.IsFirstLoginOfDayParser;

    [SecureSWF(rename="true")]
    public class IsFirstLoginOfDayEvent extends MessageEvent implements IMessageEvent {

        public function IsFirstLoginOfDayEvent(k:Function);

        public function getParser():IsFirstLoginOfDayParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.handshake

