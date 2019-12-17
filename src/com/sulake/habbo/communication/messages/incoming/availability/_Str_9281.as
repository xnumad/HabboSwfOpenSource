package com.sulake.habbo.communication.messages.incoming.availability
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.availability._Str_7162;

    public class _Str_9281 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9281(k:Function)
        {
            super(k, _Str_7162);
        }

        public function getParser():_Str_7162
        {
            return _parser as _Str_7162;
        }
    }
}
