//com.sulake.habbo.communication.messages.incoming.groupforums.PostThreadMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.PostThreadMessageParser;

    [SecureSWF(rename="true")]
    public class PostThreadMessageEvent extends MessageEvent implements IMessageEvent {

        public function PostThreadMessageEvent(k:Function);

        public function getParser():PostThreadMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

