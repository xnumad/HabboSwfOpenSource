package com.sulake.habbo.communication.messages.parser.catalog
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BuildersClubFurniCountMessageParser implements IMessageParser
    {
        private var _furniCount:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._furniCount = k.readInteger();
            return true;
        }

        public function get furniCount():int
        {
            return this._furniCount;
        }
    }
}
