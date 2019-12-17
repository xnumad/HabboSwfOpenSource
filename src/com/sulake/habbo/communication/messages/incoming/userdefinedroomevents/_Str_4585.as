package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents._Str_7138;

    public class _Str_4585 extends MessageEvent implements IMessageEvent 
    {
        public static const _Str_18436:int = 6;
        public static const _Str_17787:int = 7;

        public function _Str_4585(k:Function)
        {
            super(k, _Str_7138);
        }

        public function getParser():_Str_7138
        {
            return this._parser as _Str_7138;
        }
    }
}
