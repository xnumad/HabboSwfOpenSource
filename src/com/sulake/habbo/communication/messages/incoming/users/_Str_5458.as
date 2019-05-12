package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_10999;
    import com.sulake.core.utils.Map;

    public class _Str_5458 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5458(k:Function)
        {
            super(k, _Str_10999);
        }

        public function get badges():Map
        {
            return (_parser as _Str_10999).badges;
        }
    }
}
