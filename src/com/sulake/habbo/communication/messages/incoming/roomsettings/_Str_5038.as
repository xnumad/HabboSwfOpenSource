package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6564;

    public class _Str_5038 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5038(k:Function)
        {
            super(k, _Str_6564);
        }

        public function getParser():_Str_6564
        {
            return this._parser as _Str_6564;
        }
    }
}
