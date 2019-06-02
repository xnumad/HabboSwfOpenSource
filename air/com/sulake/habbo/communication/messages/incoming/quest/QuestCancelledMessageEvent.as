//com.sulake.habbo.communication.messages.incoming.quest.QuestCancelledMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestCancelledMessageParser;

    [SecureSWF(rename="true")]
    public class QuestCancelledMessageEvent extends MessageEvent implements IMessageEvent {

        public function QuestCancelledMessageEvent(k:Function);

        public function getParser():QuestCancelledMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

