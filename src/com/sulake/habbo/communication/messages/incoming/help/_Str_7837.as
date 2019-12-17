package com.sulake.habbo.communication.messages.incoming.help
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._Str_7877;

    public class _Str_7837 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7837(k:Function)
        {
            super(k, _Str_7877);
        }

        public function getParser():_Str_7877
        {
            return _parser as _Str_7877;
        }
    }
}
