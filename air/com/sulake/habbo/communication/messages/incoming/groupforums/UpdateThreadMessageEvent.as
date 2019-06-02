//com.sulake.habbo.communication.messages.incoming.groupforums.UpdateThreadMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.UpdateThreadMessageParser;

    [SecureSWF(rename="true")]
    public class UpdateThreadMessageEvent extends MessageEvent implements IMessageEvent {

        public function UpdateThreadMessageEvent(k:Function);

        public function getParser():UpdateThreadMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

