//com.sulake.habbo.communication.messages.incoming.quest.EpicPopupMessageEvent

package com.sulake.habbo.communication.messages.incoming.quest{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.quest.EpicPopupMessageParser;

    [SecureSWF(rename="true")]
    public class EpicPopupMessageEvent extends MessageEvent implements IMessageEvent {

        public function EpicPopupMessageEvent(k:Function);

        public function getParser():EpicPopupMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.quest

