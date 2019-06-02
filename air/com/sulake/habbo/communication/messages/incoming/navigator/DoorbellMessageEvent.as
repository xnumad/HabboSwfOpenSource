//com.sulake.habbo.communication.messages.incoming.navigator.DoorbellMessageEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class DoorbellMessageEvent extends MessageEvent implements IMessageEvent {

        public function DoorbellMessageEvent(k:Function);

        public function get userName():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

