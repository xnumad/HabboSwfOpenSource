package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_4393;

    public class _Str_8464 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8464(k:Function)
        {
            super(k, _Str_4393);
        }

        public function getParser():_Str_4393
        {
            return _parser as _Str_4393;
        }
    }
}
