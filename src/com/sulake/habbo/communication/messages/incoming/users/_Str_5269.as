package com.sulake.habbo.communication.messages.incoming.users
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_9422;
    import com.sulake.core.utils.Map;

    public class _Str_5269 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5269(k:Function)
        {
            super(k, _Str_9422);
        }

        public function get userId():int
        {
            return (_parser as _Str_9422).userId;
        }

        public function get _Str_14823():Map
        {
            return (_parser as _Str_9422)._Str_14823;
        }
    }
}
