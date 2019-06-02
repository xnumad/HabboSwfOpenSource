//com.sulake.habbo.communication.messages.incoming.advertisement.InterstitialMessageEvent

package com.sulake.habbo.communication.messages.incoming.advertisement{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.advertisement.InterstitialMessageParser;

    [SecureSWF(rename="true")]
    public class InterstitialMessageEvent extends MessageEvent implements IMessageEvent {

        public function InterstitialMessageEvent(k:Function);

        public function getParser():InterstitialMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.advertisement

