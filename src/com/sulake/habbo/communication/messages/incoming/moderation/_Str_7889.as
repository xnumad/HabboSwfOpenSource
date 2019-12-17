package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_6763;

    public class _Str_7889 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7889(k:Function)
        {
            super(k, _Str_6763);
        }

        public function getParser():_Str_6763
        {
            return _parser as _Str_6763;
        }
    }
}
