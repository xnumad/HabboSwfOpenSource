package com.sulake.habbo.communication.messages.incoming.game.score
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.score._Str_8582;

    public class _Str_11645 extends MessageEvent 
    {
        public function _Str_11645(k:Function)
        {
            super(k, _Str_8582);
        }

        public function getParser():_Str_8582
        {
            return this._parser as _Str_8582;
        }
    }
}
