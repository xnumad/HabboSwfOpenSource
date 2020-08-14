package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.userdefinedroomevents.OpenMessageParser;

    public class _Str_8791 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8791(k:Function)
        {
            super(k, OpenMessageParser);
        }

        public function getParser():OpenMessageParser
        {
            return this._parser as OpenMessageParser;
        }
    }
}
