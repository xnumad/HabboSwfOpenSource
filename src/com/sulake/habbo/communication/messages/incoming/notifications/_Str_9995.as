package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_9401;

    public class _Str_9995 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9995(k:Function)
        {
            super(k, _Str_9401);
        }

        public function getParser():_Str_9401
        {
            return _parser as _Str_9401;
        }
    }
}
