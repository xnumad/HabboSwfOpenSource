package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.avatareffect._Str_8175;

    public class _Str_5720 extends MessageEvent 
    {
        public function _Str_5720(k:Function)
        {
            super(k, _Str_8175);
        }

        public function getParser():_Str_8175
        {
            return _parser as _Str_8175;
        }
    }
}
