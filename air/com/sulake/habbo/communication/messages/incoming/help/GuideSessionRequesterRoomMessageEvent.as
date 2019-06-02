//com.sulake.habbo.communication.messages.incoming.help.GuideSessionRequesterRoomMessageEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.GuideSessionRequesterRoomMessageParser;

    [SecureSWF(rename="true")]
    public class GuideSessionRequesterRoomMessageEvent extends MessageEvent implements IMessageEvent {

        public function GuideSessionRequesterRoomMessageEvent(k:Function);

        public function getParser():GuideSessionRequesterRoomMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

