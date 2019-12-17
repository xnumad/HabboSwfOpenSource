package com.sulake.habbo.communication.messages.incoming.poll
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.poll._Str_7203;

    public class _Str_8693 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8693(k:Function)
        {
            super(k, _Str_7203);
        }

        public function getParser():_Str_7203
        {
            return _parser as _Str_7203;
        }
    }
}
