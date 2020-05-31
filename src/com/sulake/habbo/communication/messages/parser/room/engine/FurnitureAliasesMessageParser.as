package com.sulake.habbo.communication.messages.parser.room.engine
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FurnitureAliasesMessageParser implements IMessageParser
    {
        private var _aliases:Map = null;

        public function FurnitureAliasesMessageParser()
        {
            this._aliases = new Map();
        }

        public function get aliasCount():int
        {
            return this._aliases.length;
        }

        public function getName(k:int):String
        {
            if (((k < 0) || (k >= this.aliasCount)))
            {
                return null;
            }
            return this._aliases.getKey(k);
        }

        public function getAlias(k:int):String
        {
            if (((k < 0) || (k >= this.aliasCount)))
            {
                return null;
            }
            return this._aliases.getWithIndex(k);
        }

        public function flush():Boolean
        {
            this._aliases.reset();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:String;
            var _local_5:String;
            this._aliases.reset();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readString();
                _local_5 = k.readString();
                this._aliases.remove(_local_4);
                this._aliases.add(_local_4, _local_5);
                _local_3++;
            }
            return true;
        }
    }
}
