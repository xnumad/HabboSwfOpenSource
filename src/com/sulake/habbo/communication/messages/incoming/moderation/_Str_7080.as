package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8164;

    public class _Str_7080 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7080(k:Function)
        {
            super(k, _Str_8164);
        }

        public function getParser():_Str_8164
        {
            return _parser as _Str_8164;
        }
    }
}
