package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_7400;

    public class _Str_9492 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9492(k:Function)
        {
            super(k, _Str_7400);
        }

        public function getParser():_Str_7400
        {
            return this._parser as _Str_7400;
        }
    }
}
