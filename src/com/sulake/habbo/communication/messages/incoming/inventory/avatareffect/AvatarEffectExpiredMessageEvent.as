package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectExpiredMessageParser;

    public class AvatarEffectExpiredMessageEvent extends MessageEvent
    {
        public function AvatarEffectExpiredMessageEvent(k:Function)
        {
            super(k, AvatarEffectExpiredMessageParser);
        }

        public function getParser():AvatarEffectExpiredMessageParser
        {
            return _parser as AvatarEffectExpiredMessageParser;
        }
    }
}
