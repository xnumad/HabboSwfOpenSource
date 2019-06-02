//com.sulake.habbo.communication.messages.incoming.users.IgnoreResultMessageEvent

package com.sulake.habbo.communication.messages.incoming.users{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;

    [SecureSWF(rename="true")]
    public class IgnoreResultMessageEvent extends MessageEvent implements IMessageEvent {

        public function IgnoreResultMessageEvent(k:Function);

        public function get result():int;

        public function get name():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.users

