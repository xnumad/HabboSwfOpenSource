package com.sulake.habbo.communication.messages.incoming._Str_567
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.camera._Str_9206;

    public class _Str_15969 extends MessageEvent 
    {
        public function _Str_15969(k:Function)
        {
            super(k, _Str_9206);
        }

        public function getParser():_Str_9206
        {
            return _parser as _Str_9206;
        }
    }
}
