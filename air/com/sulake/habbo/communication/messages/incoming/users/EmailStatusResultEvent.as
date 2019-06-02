//com.sulake.habbo.communication.messages.incoming.users.EmailStatusResultEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.EmailStatusParser;

    [SecureSWF(rename="true")]
    public class EmailStatusResultEvent extends MessageEvent implements IMessageEvent {

        public function EmailStatusResultEvent(k:Function);

        public function getParser():EmailStatusParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

