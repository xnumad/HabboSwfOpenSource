package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_7164;

    public class _Str_4508 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4508(k:Function)
        {
            super(k, _Str_7164);
        }

        public function get amount():int
        {
            return (_parser as _Str_7164).amount;
        }

        public function get change():int
        {
            return (_parser as _Str_7164).change;
        }

        public function get type():int
        {
            return (_parser as _Str_7164).type;
        }
    }
}
