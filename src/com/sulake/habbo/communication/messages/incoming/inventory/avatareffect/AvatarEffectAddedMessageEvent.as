package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectAddedMessageParser;

    public class AvatarEffectAddedMessageEvent extends MessageEvent
    {
        public function AvatarEffectAddedMessageEvent(k:Function)
        {
            super(k, AvatarEffectAddedMessageParser);
        }

        public function getParser():AvatarEffectAddedMessageParser
        {
            return _parser as AvatarEffectAddedMessageParser;
        }
    }
}
