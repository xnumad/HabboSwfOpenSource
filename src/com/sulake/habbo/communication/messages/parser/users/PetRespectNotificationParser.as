package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.Pet;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PetRespectNotificationParser implements IMessageParser
    {
        public static const PET_TYPE_MONSTERPLANT:int = 16;

        private var _respect:int;
        private var _petOwnerId:int;
        private var _petData:Pet;


        public function flush():Boolean
        {
            this._petData = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._respect = k.readInteger();
            this._petOwnerId = k.readInteger();
            this._petData = new Pet(k);
            return true;
        }

        public function get petOwnerId():int
        {
            return this._petOwnerId;
        }

        public function get respect():int
        {
            return this._respect;
        }

        public function get petData():Pet
        {
            return this._petData;
        }

        public function isTreat():Boolean
        {
            return this._petData.typeId == PET_TYPE_MONSTERPLANT;
        }
    }
}
