//com.sulake.habbo.communication.messages.incoming.groupforums.ForumDataMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.ForumDataMessageParser;

    [SecureSWF(rename="true")]
    public class ForumDataMessageEvent extends MessageEvent implements IMessageEvent {

        public function ForumDataMessageEvent(k:Function);

        public function getParser():ForumDataMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

