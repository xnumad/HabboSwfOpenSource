package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.NestBreedingSuccessParser;

    public class _Str_9632 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9632(k:Function)
        {
            super(k, NestBreedingSuccessParser);
        }

        public function getParser():NestBreedingSuccessParser
        {
            return _parser as NestBreedingSuccessParser;
        }
    }
}
