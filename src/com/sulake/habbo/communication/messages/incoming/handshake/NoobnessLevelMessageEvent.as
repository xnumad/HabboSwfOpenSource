package com.sulake.habbo.communication.messages.incoming.handshake
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.handshake.NoobnessLevelMessageParser;

    public class NoobnessLevelMessageEvent extends MessageEvent implements IMessageEvent 
    {
        public function NoobnessLevelMessageEvent(k:Function)
        {
            super(k, NoobnessLevelMessageParser);
        }

        public function get noobnessLevel():int
        {
            return (this._parser as NoobnessLevelMessageParser).noobnessLevel;
        }
    }
}
