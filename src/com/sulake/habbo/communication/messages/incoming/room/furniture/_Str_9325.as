package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7559;

    public class _Str_9325 extends MessageEvent 
    {
        public function _Str_9325(k:Function)
        {
            super(k, _Str_7559);
        }

        public function getParser():_Str_7559
        {
            return parser as _Str_7559;
        }
    }
}
