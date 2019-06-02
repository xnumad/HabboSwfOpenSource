//com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectsMessageEvent

package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectsMessageParser;

    [SecureSWF(rename="true")]
    public class AvatarEffectsMessageEvent extends MessageEvent {

        public function AvatarEffectsMessageEvent(k:Function);

        public function getParser():AvatarEffectsMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect

