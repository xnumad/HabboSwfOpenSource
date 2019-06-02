//com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatAccessDeniedMessageParser;

    [SecureSWF(rename="true")]
    public class FlatAccessDeniedMessageEvent extends MessageEvent implements IMessageEvent {

        public function FlatAccessDeniedMessageEvent(k:Function);

        public function getParser():FlatAccessDeniedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

