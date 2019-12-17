package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_9296;

    public class _Str_4910 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_4910(k:Function)
        {
            super(k, _Str_9296);
        }

        public function getParser():_Str_9296
        {
            return this._parser as _Str_9296;
        }
    }
}
