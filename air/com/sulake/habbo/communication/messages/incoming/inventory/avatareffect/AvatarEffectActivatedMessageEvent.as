//com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectActivatedMessageEvent

package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectActivatedMessageParser;

    [SecureSWF(rename="true")]
    public class AvatarEffectActivatedMessageEvent extends MessageEvent {

        public function AvatarEffectActivatedMessageEvent(k:Function);

        public function getParser():AvatarEffectActivatedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect

