package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_4574;

    public class _Str_16667 extends MessageEvent 
    {
        public function _Str_16667(k:Function)
        {
            super(k, _Str_4574);
        }

        public function getParser():_Str_4574
        {
            return this._parser as _Str_4574;
        }
    }
}
