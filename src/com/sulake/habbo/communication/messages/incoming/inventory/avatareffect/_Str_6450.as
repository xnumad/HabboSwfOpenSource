package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectsMessageParser;

    public class _Str_6450 extends MessageEvent 
    {
        public function _Str_6450(k:Function)
        {
            super(k, AvatarEffectsMessageParser);
        }

        public function getParser():AvatarEffectsMessageParser
        {
            return _parser as AvatarEffectsMessageParser;
        }
    }
}
