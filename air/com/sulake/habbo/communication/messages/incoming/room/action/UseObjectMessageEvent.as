//com.sulake.habbo.communication.messages.incoming.room.action.UseObjectMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.action{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.UseObjectMessageParser;

    [SecureSWF(rename="true")]
    public class UseObjectMessageEvent extends MessageEvent implements IMessageEvent {

        public function UseObjectMessageEvent(k:Function);

        public function getParser():UseObjectMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.action

