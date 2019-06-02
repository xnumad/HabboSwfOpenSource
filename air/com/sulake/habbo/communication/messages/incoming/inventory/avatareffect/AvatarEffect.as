//com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffect

package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect{
    public class AvatarEffect {

        private var _type:int;
        private var _subType:int;
        private var _duration:int;
        private var _inactiveEffectsInInventory:int;
        private var _secondsLeftIfActive:int;

        public function AvatarEffect();

        public function get type():int;

        public function set type(k:int):void;

        public function get subType():int;

        public function set subType(k:int):void;

        public function get duration():int;

        public function set duration(k:int):void;

        public function get inactiveEffectsInInventory():int;

        public function set inactiveEffectsInInventory(k:int):void;

        public function get secondsLeftIfActive():int;

        public function set secondsLeftIfActive(k:int):void;


    }
}//package com.sulake.habbo.communication.messages.incoming.inventory.avatareffect

