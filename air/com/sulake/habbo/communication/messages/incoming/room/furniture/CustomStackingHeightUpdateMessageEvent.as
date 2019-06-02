//com.sulake.habbo.communication.messages.incoming.room.furniture.CustomStackingHeightUpdateMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.furniture{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture.CustomStackingHeightUpdateMessageParser;

    public class CustomStackingHeightUpdateMessageEvent extends MessageEvent implements IMessageEvent {

        public function CustomStackingHeightUpdateMessageEvent(k:Function);

        public function getParser():CustomStackingHeightUpdateMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.furniture

