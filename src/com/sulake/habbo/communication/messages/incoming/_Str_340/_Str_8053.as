package com.sulake.habbo.communication.messages.incoming._Str_340
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.camera._Str_8439;

    public class _Str_8053 extends MessageEvent 
    {
        public function _Str_8053(k:Function)
        {
            super(k, _Str_8439);
        }

        public function getParser():_Str_8439
        {
            return this._parser as _Str_8439;
        }
    }
}
