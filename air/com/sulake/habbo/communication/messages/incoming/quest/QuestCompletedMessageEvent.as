//com.sulake.habbo.communication.messages.incoming.quest.QuestCompletedMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestCompletedMessageParser;

    [SecureSWF(rename="true")]
    public class QuestCompletedMessageEvent extends MessageEvent implements IMessageEvent {

        public function QuestCompletedMessageEvent(k:Function);

        public function getParser():QuestCompletedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

