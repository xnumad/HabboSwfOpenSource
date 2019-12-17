package com.sulake.habbo.communication.messages.incoming.groupforums
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.groupforums._Str_9290;

    public class _Str_8905 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8905(k:Function)
        {
            super(k, _Str_9290);
        }

        public function getParser():_Str_9290
        {
            return this._parser as _Str_9290;
        }
    }
}
