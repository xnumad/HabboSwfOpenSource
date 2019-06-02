//com.sulake.habbo.communication.messages.incoming.groupforums.ForumThreadsMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.ForumThreadsMessageParser;

    [SecureSWF(rename="true")]
    public class ForumThreadsMessageEvent extends MessageEvent implements IMessageEvent {

        public function ForumThreadsMessageEvent(k:Function);

        public function getParser():ForumThreadsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

