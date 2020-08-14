package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.WiredValidationErrorParser;

    public class _Str_7323 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7323(k:Function)
        {
            super(k, WiredValidationErrorParser);
        }

        public function getParser():WiredValidationErrorParser
        {
            return this._parser as WiredValidationErrorParser;
        }
    }
}
