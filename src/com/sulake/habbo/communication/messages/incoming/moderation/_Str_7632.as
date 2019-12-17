package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7621;

    public class _Str_7632 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7632(k:Function)
        {
            super(k, _Str_7621);
        }

        public function getParser():_Str_7621
        {
            return _parser as _Str_7621;
        }
    }
}
