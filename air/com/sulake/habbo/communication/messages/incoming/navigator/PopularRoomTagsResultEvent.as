//com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsResultEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.PopularRoomTagsResultMessageParser;

    [SecureSWF(rename="true")]
    public class PopularRoomTagsResultEvent extends MessageEvent implements IMessageEvent {

        public function PopularRoomTagsResultEvent(k:Function);

        public function getParser():PopularRoomTagsResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

