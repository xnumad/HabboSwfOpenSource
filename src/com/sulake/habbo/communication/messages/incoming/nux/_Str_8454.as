package com.sulake.habbo.communication.messages.incoming.nux
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.nux._Str_9322;

    public class _Str_8454 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8454(k:Function)
        {
            super(k, _Str_9322);
        }

        public function getParser():_Str_9322
        {
            return _parser as _Str_9322;
        }
    }
}
