package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8104;

    public class _Str_9591 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9591(k:Function)
        {
            super(k, _Str_8104);
        }

        public function getParser():_Str_8104
        {
            return _parser as _Str_8104;
        }
    }
}
