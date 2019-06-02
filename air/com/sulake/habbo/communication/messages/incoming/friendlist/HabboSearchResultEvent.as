//com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.HabboSearchResultMessageParser;

    [SecureSWF(rename="true")]
    public class HabboSearchResultEvent extends MessageEvent implements IMessageEvent {

        public function HabboSearchResultEvent(k:Function);

        public function getParser():HabboSearchResultMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

