//com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectExpiredMessageEvent

package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectExpiredMessageParser;

    [SecureSWF(rename="true")]
    public class AvatarEffectExpiredMessageEvent extends MessageEvent {

        public function AvatarEffectExpiredMessageEvent(k:Function);

        public function getParser():AvatarEffectExpiredMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect

