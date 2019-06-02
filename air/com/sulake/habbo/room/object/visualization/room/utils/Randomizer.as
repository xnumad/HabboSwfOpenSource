//com.sulake.habbo.room.object.visualization.room.utils.Randomizer

package com.sulake.habbo.room.object.visualization.room.utils{
    public class Randomizer {

        public static const DEFAULT_SEED:int;
        public static const DEFAULT_MODULUS:int;
        private static var _randomizer:Randomizer;

        private var _seed:int;
        private var _modulus:int;
        private var _multiplier:int;
        private var _increment:int;

        public function Randomizer();

        public static function setSeed(k:int=1):void;

        public static function setModulus(k:int=16777216):void;

        public static function getValues(k:int, _arg_2:int, _arg_3:int):Array;

        public static function getArray(k:int, _arg_2:int):Array;


        public function set seed(k:int):void;

        public function set modulus(k:int):void;

        public function dispose():void;

        public function getRandomValues(k:int, _arg_2:int, _arg_3:int):Array;

        public function getRandomArray(k:int, _arg_2:int):Array;

        private function iterate():int;

        private function iterateScaled(k:int, _arg_2:int):int;


    }
}//package com.sulake.habbo.room.object.visualization.room.utils

