//com.sulake.habbo.communication.messages.incoming.mysterybox.GotMysteryBoxPrizeMessageEvent

package com.sulake.habbo.communication.messages.incoming.mysterybox{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.GotMysteryBoxPrizeMessageParser;

    [SecureSWF(rename="true")]
    public class GotMysteryBoxPrizeMessageEvent extends MessageEvent implements IMessageEvent {

        public function GotMysteryBoxPrizeMessageEvent(k:Function);

        public function getParser():GotMysteryBoxPrizeMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.mysterybox

