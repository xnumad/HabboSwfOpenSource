package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents._Str_7758;

    public class _Str_7323 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7323(k:Function)
        {
            super(k, _Str_7758);
        }

        public function getParser():_Str_7758
        {
            return this._parser as _Str_7758;
        }
    }
}
