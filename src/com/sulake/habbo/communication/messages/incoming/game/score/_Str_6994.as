package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_7341;

    public class _Str_6994 extends MessageEvent 
    {
        public function _Str_6994(k:Function)
        {
            super(k, _Str_7341);
        }

        public function getParser():_Str_7341
        {
            return this._parser as _Str_7341;
        }
    }
}
