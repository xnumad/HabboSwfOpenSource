//com.sulake.habbo.communication.messages.incoming.moderation.ModMessageEvent

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation.ModMessageParser;

    [SecureSWF(rename="true")]
    public class ModMessageEvent extends MessageEvent implements IMessageEvent {

        public function ModMessageEvent(k:Function);

        public function getParser():ModMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

