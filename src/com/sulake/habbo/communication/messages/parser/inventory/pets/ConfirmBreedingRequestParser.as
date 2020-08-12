package com.sulake.habbo.communication.messages.parser.inventory.pets
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.pets.BreedingPetInfo;
    import com.sulake.habbo.communication.messages.incoming.room.pets.RarityCategoryData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ConfirmBreedingRequestParser implements IMessageParser
    {
        private var _nestId:int;
        private var _pet1:BreedingPetInfo;
        private var _pet2:BreedingPetInfo;
        private var _rarityCategories:Array;
        private var _Str_21973:int;


        public function flush():Boolean
        {
            var k:RarityCategoryData;
            this._nestId = 0;
            if (this._pet1)
            {
                this._pet1.dispose();
                this._pet1 = null;
            }
            if (this._pet2)
            {
                this._pet2.dispose();
                this._pet2 = null;
            }
            for each (k in this._rarityCategories)
            {
                k.dispose();
            }
            this._rarityCategories = [];
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._nestId = k.readInteger();
            this._pet1 = new BreedingPetInfo(k);
            this._pet2 = new BreedingPetInfo(k);
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._rarityCategories.push(new RarityCategoryData(k));
                _local_3++;
            }
            this._Str_21973 = k.readInteger();
            return true;
        }

        public function get nestId():int
        {
            return this._nestId;
        }

        public function get pet1():BreedingPetInfo
        {
            return this._pet1;
        }

        public function get pet2():BreedingPetInfo
        {
            return this._pet2;
        }

        public function get rarityCategories():Array
        {
            return this._rarityCategories;
        }

        public function get _Str_24905():int
        {
            return this._Str_21973;
        }
    }
}
