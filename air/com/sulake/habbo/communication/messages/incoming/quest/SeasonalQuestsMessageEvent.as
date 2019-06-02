//com.sulake.habbo.communication.messages.incoming.quest.SeasonalQuestsMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.SeasonalQuestsMessageParser;

    [SecureSWF(rename="true")]
    public class SeasonalQuestsMessageEvent extends MessageEvent implements IMessageEvent {

        public function SeasonalQuestsMessageEvent(k:Function);

        public function getParser():SeasonalQuestsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

