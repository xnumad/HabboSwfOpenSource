package com.sulake.habbo.communication.messages.incoming._Str_340
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera._Str_9565;

    public class _Str_7565 extends MessageEvent 
    {
        public function _Str_7565(k:Function)
        {
            super(k, _Str_9565);
        }

        public function getParser():_Str_9565
        {
            return this._parser as _Str_9565;
        }
    }
}
