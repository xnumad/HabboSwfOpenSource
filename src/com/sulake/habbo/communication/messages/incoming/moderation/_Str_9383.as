package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_7250;

    public class _Str_9383 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9383(k:Function)
        {
            super(k, _Str_7250);
        }

        public function getParser():_Str_7250
        {
            return _parser as _Str_7250;
        }
    }
}
