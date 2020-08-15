package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectActivatedMessageParser;

    public class AvatarEffectActivatedMessageEvent extends MessageEvent
    {
        public function AvatarEffectActivatedMessageEvent(k:Function)
        {
            super(k, AvatarEffectActivatedMessageParser);
        }

        public function getParser():AvatarEffectActivatedMessageParser
        {
            return _parser as AvatarEffectActivatedMessageParser;
        }
    }
}
