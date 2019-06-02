//com.sulake.habbo.communication.messages.incoming.friendlist.MiniMailUnreadCountEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.MiniMailUnreadCountMessageParser;

    public class MiniMailUnreadCountEvent extends MessageEvent implements IMessageEvent {

        public function MiniMailUnreadCountEvent(k:Function);

        public function getParser():MiniMailUnreadCountMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

