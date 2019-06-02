//com.sulake.habbo.avatareditor.view.Effect

package com.sulake.habbo.avatareditor.view{
    import starling.events.EventDispatcher;

    public class Effect extends EventDispatcher {

        private var _type:int;
        private var _subType:int;
        private var _duration:int;
        private var _effectsInInventory:int;
        private var _secondsLeftStamped:int;
        private var _isActive:Boolean;
        private var _isSelected:Boolean;
        private var _isInUse:Boolean;
        private var _activatedTimeStamp:Date;

        public function Effect();

        public function get type():int;

        public function get subType():int;

        public function get duration():int;

        public function get amountInInventory():int;

        public function get isActive():Boolean;

        public function get isInUse():Boolean;

        public function get isSelected():Boolean;

        public function get secondsLeft():int;

        public function set type(k:int):void;

        public function set subType(k:int):void;

        public function set duration(k:int):void;

        public function set secondsLeft(k:int):void;

        public function set isSelected(k:Boolean):void;

        public function set isInUse(k:Boolean):void;

        public function set amountInInventory(k:int):void;

        public function set isActive(k:Boolean):void;

        public function setOneEffectExpired():void;


    }
}//package com.sulake.habbo.avatareditor.view

