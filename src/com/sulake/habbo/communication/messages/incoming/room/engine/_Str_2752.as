package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_4522;

    public class _Str_2752 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_2752(k:Function)
        {
            super(k, _Str_4522);
        }

        public function getParser():_Str_4522
        {
            return _parser as _Str_4522;
        }
    }
}
