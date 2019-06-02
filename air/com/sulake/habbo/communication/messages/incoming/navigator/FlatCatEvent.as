//com.sulake.habbo.communication.messages.incoming.navigator.FlatCatEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FlatCatMessageParser;

    [SecureSWF(rename="true")]
    public class FlatCatEvent extends MessageEvent implements IMessageEvent {

        public function FlatCatEvent(k:Function);

        public function getParser():FlatCatMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

