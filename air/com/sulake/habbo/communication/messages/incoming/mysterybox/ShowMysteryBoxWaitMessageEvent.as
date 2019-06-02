//com.sulake.habbo.communication.messages.incoming.mysterybox.ShowMysteryBoxWaitMessageEvent

package com.sulake.habbo.communication.messages.incoming.mysterybox{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.ShowMysteryBoxWaitMessageParser;

    [SecureSWF(rename="true")]
    public class ShowMysteryBoxWaitMessageEvent extends MessageEvent implements IMessageEvent {

        public function ShowMysteryBoxWaitMessageEvent(k:Function);

        public function getParser():ShowMysteryBoxWaitMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.mysterybox

