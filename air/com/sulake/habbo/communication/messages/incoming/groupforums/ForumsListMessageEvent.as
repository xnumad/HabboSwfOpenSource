//com.sulake.habbo.communication.messages.incoming.groupforums.ForumsListMessageEvent

package com.sulake.habbo.communication.messages.incoming.groupforums{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums.GetForumsListMessageParser;

    [SecureSWF(rename="true")]
    public class ForumsListMessageEvent extends MessageEvent implements IMessageEvent {

        public function ForumsListMessageEvent(k:Function);

        public function getParser():GetForumsListMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.groupforums

