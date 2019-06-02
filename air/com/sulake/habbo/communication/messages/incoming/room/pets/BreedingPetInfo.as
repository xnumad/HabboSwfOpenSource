//com.sulake.habbo.communication.messages.incoming.room.pets.BreedingPetInfo

package com.sulake.habbo.communication.messages.incoming.room.pets{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class BreedingPetInfo {

        private var _webId:int;
        private var _name:String;
        private var _level:int;
        private var _figure:String;
        private var _owner:String;

        public function BreedingPetInfo(k:IMessageDataWrapper);

        public function dispose():void;

        public function get webId():int;

        public function get name():String;

        public function get level():int;

        public function get figure():String;

        public function get owner():String;


    }
}//package com.sulake.habbo.communication.messages.incoming.room.pets

