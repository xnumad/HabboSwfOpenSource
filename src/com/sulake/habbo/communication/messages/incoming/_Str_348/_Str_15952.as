package com.sulake.habbo.communication.messages.incoming._Str_348
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_8889;

    public class _Str_15952 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_15952(k:Function)
        {
            super(k, _Str_8889);
        }

        public function getParser():_Str_8889
        {
            return this._parser as _Str_8889;
        }
    }
}
