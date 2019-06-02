//com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectSelectedMessageEvent

package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectSelectedMessageParser;

    [SecureSWF(rename="true")]
    public class AvatarEffectSelectedMessageEvent extends MessageEvent {

        public function AvatarEffectSelectedMessageEvent(k:Function);

        public function getParser():AvatarEffectSelectedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect

