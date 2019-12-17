package com.sulake.habbo.communication.messages.incoming._Str_447
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser._Str_449._Str_9249;

    public class _Str_8427 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8427(k:Function)
        {
            super(k, _Str_9249);
        }

        public function getParser():_Str_9249
        {
            return _parser as _Str_9249;
        }
    }
}
