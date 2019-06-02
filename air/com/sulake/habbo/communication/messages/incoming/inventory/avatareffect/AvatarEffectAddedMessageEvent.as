//com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectAddedMessageEvent

package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectAddedMessageParser;

    [SecureSWF(rename="true")]
    public class AvatarEffectAddedMessageEvent extends MessageEvent {

        public function AvatarEffectAddedMessageEvent(k:Function);

        public function getParser():AvatarEffectAddedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect

