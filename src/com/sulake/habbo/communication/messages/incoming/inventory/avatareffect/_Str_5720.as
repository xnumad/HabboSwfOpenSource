package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectActivatedMessageParser;

    public class _Str_5720 extends MessageEvent 
    {
        public function _Str_5720(k:Function)
        {
            super(k, AvatarEffectActivatedMessageParser);
        }

        public function getParser():AvatarEffectActivatedMessageParser
        {
            return _parser as AvatarEffectActivatedMessageParser;
        }
    }
}
