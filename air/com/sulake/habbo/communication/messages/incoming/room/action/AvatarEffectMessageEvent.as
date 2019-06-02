//com.sulake.habbo.communication.messages.incoming.room.action.AvatarEffectMessageEvent

package com.sulake.habbo.communication.messages.incoming.room.action{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.AvatarEffectMessageParser;

    [SecureSWF(rename="true")]
    public class AvatarEffectMessageEvent extends MessageEvent {

        public function AvatarEffectMessageEvent(k:Function);

        public function getParser():AvatarEffectMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.action

