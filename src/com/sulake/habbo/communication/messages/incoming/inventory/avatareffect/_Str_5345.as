package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_7054;

    public class _Str_5345 extends MessageEvent 
    {
        public function _Str_5345(k:Function)
        {
            super(k, _Str_7054);
        }

        public function getParser():_Str_7054
        {
            return _parser as _Str_7054;
        }
    }
}
