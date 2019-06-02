//com.sulake.habbo.communication.messages.incoming.mysterybox.CancelMysteryBoxWaitMessageEvent

package com.sulake.habbo.communication.messages.incoming.mysterybox{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.CancelMysteryBoxWaitMessageParser;

    [SecureSWF(rename="true")]
    public class CancelMysteryBoxWaitMessageEvent extends MessageEvent implements IMessageEvent {

        public function CancelMysteryBoxWaitMessageEvent(k:Function);

        public function getParser():CancelMysteryBoxWaitMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.mysterybox

