package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_5199;

    public class _Str_3407 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3407(k:Function)
        {
            super(k, _Str_5199);
        }

        public function getParser():_Str_5199
        {
            return _parser as _Str_5199;
        }
    }
}
