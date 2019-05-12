package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9448 implements IMessageParser 
    {


        public function parse(k:IMessageDataWrapper):Boolean
        {
            return true;
        }

        public function flush():Boolean
        {
            return true;
        }
    }
}
