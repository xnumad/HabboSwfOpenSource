package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_6716;

    public class _Str_8674 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8674(k:Function)
        {
            super(k, _Str_6716);
        }

        public function getParser():_Str_6716
        {
            return _parser as _Str_6716;
        }
    }
}
