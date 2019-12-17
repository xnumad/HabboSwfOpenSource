package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_8394;

    public class _Str_7883 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7883(k:Function)
        {
            super(k, _Str_8394);
        }

        public function getParser():_Str_8394
        {
            return this._parser as _Str_8394;
        }
    }
}
