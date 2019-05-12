package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.notifications._Str_11969;

    public class _Str_7309 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7309(k:Function)
        {
            super(k, _Str_11969);
        }

        public function get enabled():Boolean
        {
            return (_parser as _Str_11969).enabled;
        }
    }
}
