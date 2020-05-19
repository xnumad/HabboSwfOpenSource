package com.sulake.habbo.communication.messages.parser.inventory.furni
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FurniListParser implements IMessageParser 
    {
        protected var _totalFragments:int;
        protected var _fragmentNo:int;
        private var _furniFragment:Map;


        public function get totalFragments():int
        {
            return this._totalFragments;
        }

        public function get fragmentNo():int
        {
            return this._fragmentNo;
        }

        public function get furniFragment():Map
        {
            return this._furniFragment;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:FurniData;
            this._totalFragments = k.readInteger();
            this._fragmentNo = k.readInteger();
            this._furniFragment = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new FurniData(k);
                this._furniFragment.add(_local_4.itemId, _local_4);
                _local_3++;
            }
            return true;
        }

        public function flush():Boolean
        {
            if (this._furniFragment)
            {
                this._furniFragment.dispose();
                this._furniFragment = null;
            }
            return true;
        }
    }
}
