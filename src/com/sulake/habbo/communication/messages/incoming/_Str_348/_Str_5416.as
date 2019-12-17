package com.sulake.habbo.communication.messages.incoming._Str_348
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_6554;

    public class _Str_5416 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5416(k:Function)
        {
            super(k, _Str_6554);
        }

        public function getParser():_Str_6554
        {
            return this._parser as _Str_6554;
        }
    }
}
