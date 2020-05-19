package com.sulake.habbo.communication.messages.incoming.room.action
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.action.CarryObjectMessageParser;

    public class _Str_7050 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7050(k:Function)
        {
            super(k, CarryObjectMessageParser);
        }

        public function getParser():CarryObjectMessageParser
        {
            return _parser as CarryObjectMessageParser;
        }
    }
}
