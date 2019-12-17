package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_4043;

    public class _Str_6030 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6030(k:Function)
        {
            super(k, _Str_4043);
        }

        public function getParser():_Str_4043
        {
            return this._parser as _Str_4043;
        }
    }
}
