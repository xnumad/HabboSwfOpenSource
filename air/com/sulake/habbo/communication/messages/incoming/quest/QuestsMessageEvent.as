//com.sulake.habbo.communication.messages.incoming.quest.QuestsMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.QuestsMessageParser;

    [SecureSWF(rename="true")]
    public class QuestsMessageEvent extends MessageEvent implements IMessageEvent {

        public function QuestsMessageEvent(k:Function);

        public function getParser():QuestsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

