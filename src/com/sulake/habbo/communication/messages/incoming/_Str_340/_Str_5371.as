package com.sulake.habbo.communication.messages.incoming._Str_340
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera._Str_8379;

    public class _Str_5371 extends MessageEvent 
    {
        public function _Str_5371(k:Function)
        {
            super(k, _Str_8379);
        }

        public function getParser():_Str_8379
        {
            return this._parser as _Str_8379;
        }
    }
}
