//com.sulake.habbo.communication.messages.incoming.quest.QuestDailyMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestDailyMessageParser;

    [SecureSWF(rename="true")]
    public class QuestDailyMessageEvent extends MessageEvent implements IMessageEvent {

        public function QuestDailyMessageEvent(k:Function);

        public function getParser():QuestDailyMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

