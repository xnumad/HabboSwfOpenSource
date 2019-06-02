//com.sulake.habbo.communication.messages.incoming.groupforums.UnreadForumsCountMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.UnreadForumsCountMessageParser;

    [SecureSWF(rename="true")]
    public class UnreadForumsCountMessageEvent extends MessageEvent implements IMessageEvent {

        public function UnreadForumsCountMessageEvent(k:Function);

        public function getParser():UnreadForumsCountMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

