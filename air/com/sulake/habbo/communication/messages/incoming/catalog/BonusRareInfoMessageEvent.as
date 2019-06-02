//com.sulake.habbo.communication.messages.incoming.catalog.BonusRareInfoMessageEvent

package com.sulake.habbo.communication.messages.incoming.catalog{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog.BonusRareInfoMessageParser;

    [SecureSWF(rename="true")]
    public class BonusRareInfoMessageEvent extends MessageEvent implements IMessageEvent {

        public function BonusRareInfoMessageEvent(k:Function);

        public function getParser():BonusRareInfoMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.catalog

