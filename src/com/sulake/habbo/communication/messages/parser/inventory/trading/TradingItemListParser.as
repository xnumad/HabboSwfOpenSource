package com.sulake.habbo.communication.messages.parser.inventory.trading
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.ItemDataStructure;

    public class TradingItemListParser implements IMessageParser 
    {
        private var _firstUserID:int;
        private var _firstUserItemArray:Array;
        private var _firstUserNumItems:int;
        private var _firstUserNumCredits:int;
        private var _secondUserID:int;
        private var _secondUserItemArray:Array;
        private var _secondUserNumItems:int;
        private var _secondUserNumCredits:int;


        public function get firstUserID():int
        {
            return this._firstUserID;
        }

        public function get firstUserItemArray():Array
        {
            return this._firstUserItemArray;
        }

        public function get firstUserNumItems():int
        {
            return this._firstUserNumItems;
        }

        public function get firstUserNumCredits():int
        {
            return this._firstUserNumCredits;
        }

        public function get secondUserID():int
        {
            return this._secondUserID;
        }

        public function get secondUserItemArray():Array
        {
            return this._secondUserItemArray;
        }

        public function get secondUserNumItems():int
        {
            return this._secondUserNumItems;
        }

        public function get secondUserNumCredits():int
        {
            return this._secondUserNumCredits;
        }

        public function flush():Boolean
        {
            this._firstUserID = -1;
            this._firstUserItemArray = null;
            this._firstUserNumItems = 0;
            this._firstUserNumCredits = 0;
            this._secondUserID = -1;
            this._secondUserItemArray = null;
            this._secondUserNumItems = 0;
            this._secondUserNumCredits = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._firstUserID = k.readInteger();
            this._firstUserItemArray = new Array();
            if (!this.parseItemData(k, this._firstUserItemArray))
            {
                return false;
            }
            this._firstUserNumItems = k.readInteger();
            this._firstUserNumCredits = k.readInteger();
            this._secondUserID = k.readInteger();
            this._secondUserItemArray = new Array();
            if (!this.parseItemData(k, this._secondUserItemArray))
            {
                return false;
            }
            this._secondUserNumItems = k.readInteger();
            this._secondUserNumCredits = k.readInteger();
            return true;
        }

        private function parseItemData(k:IMessageDataWrapper, _arg_2:Array):Boolean
        {
            var _local_3:int;
            _local_3 = k.readInteger();
            while (_local_3 > 0)
            {
                _arg_2.push(new ItemDataStructure(k));
                _local_3--;
            }
            return true;
        }
    }
}
