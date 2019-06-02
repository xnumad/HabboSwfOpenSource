//com.sulake.habbo.communication.messages.incoming.quest.QuestMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestMessageParser;

    [SecureSWF(rename="true")]
    public class QuestMessageEvent extends MessageEvent implements IMessageEvent {

        public function QuestMessageEvent(k:Function);

        public function getParser():QuestMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

