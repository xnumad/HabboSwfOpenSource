package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetInventoryMessageParser implements IMessageParser
    {
        protected var _totalFragments:int;
        protected var _fragmentNo:int;
        private var _petListFragment:Map;


        public function flush():Boolean
        {
            if (this._petListFragment)
            {
                this._petListFragment.dispose();
                this._petListFragment = null;
            }
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:Pet;
            this._totalFragments = k.readInteger();
            this._fragmentNo = k.readInteger();
            this._petListFragment = new Map();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = new Pet(k);
                this._petListFragment.add(_local_4.id, _local_4);
                _local_3++;
            }
            return true;
        }

        public function get _Str_24388():Map
        {
            return this._petListFragment;
        }

        public function get totalFragments():int
        {
            return this._totalFragments;
        }

        public function get fragmentNo():int
        {
            return this._fragmentNo;
        }
    }
}
