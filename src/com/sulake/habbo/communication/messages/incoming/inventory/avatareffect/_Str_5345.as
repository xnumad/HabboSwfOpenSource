package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectExpiredMessageParser;

    public class _Str_5345 extends MessageEvent 
    {
        public function _Str_5345(k:Function)
        {
            super(k, AvatarEffectExpiredMessageParser);
        }

        public function getParser():AvatarEffectExpiredMessageParser
        {
            return _parser as AvatarEffectExpiredMessageParser;
        }
    }
}
