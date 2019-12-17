package com.sulake.habbo.communication.messages.incoming._Str_348
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_14882;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_6529;

    public class _Str_17782 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_17782(k:Function)
        {
            super(k, _Str_14882);
        }

        public function getParser():_Str_6529
        {
            return this._parser as _Str_6529;
        }
    }
}
