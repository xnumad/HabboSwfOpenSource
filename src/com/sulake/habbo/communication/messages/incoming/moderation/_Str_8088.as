package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.moderation._Str_8235;

    public class _Str_8088 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8088(k:Function)
        {
            super(k, _Str_8235);
        }

        public function getParser():_Str_8235
        {
            return _parser as _Str_8235;
        }
    }
}
