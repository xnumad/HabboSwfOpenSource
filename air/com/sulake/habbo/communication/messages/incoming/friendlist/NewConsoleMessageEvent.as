//com.sulake.habbo.communication.messages.incoming.friendlist.NewConsoleMessageEvent

package com.sulake.habbo.communication.messages.incoming.friendlist{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser;

    [SecureSWF(rename="true")]
    public class NewConsoleMessageEvent extends MessageEvent implements IMessageEvent {

        public function NewConsoleMessageEvent(k:Function);

        public function getParser():NewConsoleMessageMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.friendlist

