package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action._Str_6708;

    public class _Str_7050 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7050(k:Function)
        {
            super(k, _Str_6708);
        }

        public function getParser():_Str_6708
        {
            return _parser as _Str_6708;
        }
    }
}
