package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator._Str_6683;

    public class _Str_5711 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5711(k:Function)
        {
            super(k, _Str_6683);
        }

        public function getParser():_Str_6683
        {
            return this._parser as _Str_6683;
        }
    }
}
