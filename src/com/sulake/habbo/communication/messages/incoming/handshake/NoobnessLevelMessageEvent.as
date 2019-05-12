package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_11230;

    public class NoobnessLevelMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function NoobnessLevelMessageEvent(k:Function)
        {
            super(k, _Str_11230);
        }

        public function get _Str_17519():int
        {
            return (this._parser as _Str_11230)._Str_17519;
        }
    }
}
