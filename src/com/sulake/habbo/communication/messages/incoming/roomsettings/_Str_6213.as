package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6824;

    public class _Str_6213 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_6213(k:Function)
        {
            super(k, _Str_6824);
        }

        public function getParser():_Str_6824
        {
            return this._parser as _Str_6824;
        }
    }
}
