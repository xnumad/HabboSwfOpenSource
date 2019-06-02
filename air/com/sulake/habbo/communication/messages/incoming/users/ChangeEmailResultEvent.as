//com.sulake.habbo.communication.messages.incoming.users.ChangeEmailResultEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ChangeEmailResultParser;

    [SecureSWF(rename="true")]
    public class ChangeEmailResultEvent extends MessageEvent implements IMessageEvent {

        public function ChangeEmailResultEvent(k:Function);

        public function getParser():ChangeEmailResultParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

