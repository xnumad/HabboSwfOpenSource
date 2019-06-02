//com.sulake.habbo.communication.messages.incoming.groupforums.UpdateMessageMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.UpdateMessageMessageParser;

    [SecureSWF(rename="true")]
    public class UpdateMessageMessageEvent extends MessageEvent implements IMessageEvent {

        public function UpdateMessageMessageEvent(k:Function);

        public function getParser():UpdateMessageMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

