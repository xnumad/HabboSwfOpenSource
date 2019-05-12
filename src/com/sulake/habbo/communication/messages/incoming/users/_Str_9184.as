package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_11607;

    public class _Str_9184 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9184(k:Function)
        {
            super(k, _Str_11607);
        }

        public function get _Str_16804():Array
        {
            return (_parser as _Str_11607)._Str_16804;
        }
    }
}
