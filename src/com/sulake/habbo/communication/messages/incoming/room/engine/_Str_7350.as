package com.sulake.habbo.communication.messages.incoming.room.engine
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.engine._Str_6340;

    public class _Str_7350 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7350(k:Function)
        {
            super(k, _Str_6340);
        }

        public function getParser():_Str_6340
        {
            return _parser as _Str_6340;
        }
    }
}
