package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_8438;

    public class _Str_3352 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_3352(k:Function)
        {
            super(k, _Str_8438);
        }

        public function getParser():_Str_8438
        {
            return _parser as _Str_8438;
        }
    }
}
