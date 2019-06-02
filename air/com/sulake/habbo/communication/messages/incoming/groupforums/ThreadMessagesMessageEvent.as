//com.sulake.habbo.communication.messages.incoming.groupforums.ThreadMessagesMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.ThreadMessagesMessageParser;

    [SecureSWF(rename="true")]
    public class ThreadMessagesMessageEvent extends MessageEvent implements IMessageEvent {

        public function ThreadMessagesMessageEvent(k:Function);

        public function getParser():ThreadMessagesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

