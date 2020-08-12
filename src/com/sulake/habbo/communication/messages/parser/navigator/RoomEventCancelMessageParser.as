package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomEventCancelMessageParser implements IMessageParser
    {


        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            return true;
        }
    }
}
