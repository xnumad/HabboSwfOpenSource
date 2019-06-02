//com.sulake.habbo.communication.messages.incoming.groupforums.PostMessageMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.PostMessageMessageParser;

    [SecureSWF(rename="true")]
    public class PostMessageMessageEvent extends MessageEvent implements IMessageEvent {

        public function PostMessageMessageEvent(k:Function);

        public function getParser():PostMessageMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

