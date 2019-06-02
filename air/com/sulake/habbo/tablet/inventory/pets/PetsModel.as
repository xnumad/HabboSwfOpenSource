//com.sulake.habbo.tablet.inventory.pets.PetsModel

package com.sulake.habbo.tablet.inventory.pets{
    import com.sulake.habbo.tablet.inventory.IInventoryModel;
    import com.sulake.habbo.tablet.inventory.HabboTabletInventory;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import feathers.data.ListCollection;
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.session.IRoomSession;

    public class PetsModel implements IInventoryModel {

        private var _controller:HabboTabletInventory;
        private var _communication:IHabboCommunicationManager;
        private var _collection:ListCollection;
        private var _disposed:Boolean;

        public function PetsModel(k:HabboTabletInventory, _arg_2:IHabboCommunicationManager);

        public function get disposed():Boolean;

        public function dispose():void;

        public function requestPetInventory():void;

        public function get collection():ListCollection;

        public function addPet(k:PetData):void;

        public function updatePets(k:Map):void;

        public function removePet(k:int):void;

        public function requestInitialization():void;

        public function placePetToRoom(k:int):int;

        private function getPetById(k:int):PetData;

        public function get roomSession():IRoomSession;

        public function resetUnseenItems():void;

        public function isUnseen(k:int):Boolean;

        public function removeUnseenFurniCounter(k:int):Boolean;


    }
}//package com.sulake.habbo.tablet.inventory.pets

