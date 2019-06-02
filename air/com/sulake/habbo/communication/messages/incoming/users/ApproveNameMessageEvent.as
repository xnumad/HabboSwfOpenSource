//com.sulake.habbo.communication.messages.incoming.users.ApproveNameMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.ApproveNameMessageParser;

    [SecureSWF(rename="true")]
    public class ApproveNameMessageEvent extends MessageEvent implements IMessageEvent {

        public function ApproveNameMessageEvent(k:Function);

        public function getParser():ApproveNameMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

