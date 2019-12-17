package com.sulake.habbo.communication.messages.incoming._Str_87
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges._Str_9135;

    public class _Str_8179 extends MessageEvent 
    {
        public function _Str_8179(k:Function)
        {
            super(k, _Str_9135);
        }

        public function getParser():_Str_9135
        {
            return _parser as _Str_9135;
        }
    }
}
