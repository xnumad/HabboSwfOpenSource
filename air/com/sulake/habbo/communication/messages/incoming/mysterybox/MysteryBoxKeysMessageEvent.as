//com.sulake.habbo.communication.messages.incoming.mysterybox.MysteryBoxKeysMessageEvent

package com.sulake.habbo.communication.messages.incoming.mysterybox{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.mysterybox.MysteryBoxKeysMessageParser;

    [SecureSWF(rename="true")]
    public class MysteryBoxKeysMessageEvent extends MessageEvent implements IMessageEvent {

        public function MysteryBoxKeysMessageEvent(k:Function);

        public function getParser():MysteryBoxKeysMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.mysterybox

