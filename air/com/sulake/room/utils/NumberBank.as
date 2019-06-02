//com.sulake.room.utils.NumberBank

package com.sulake.room.utils{
    public class NumberBank {

        private var _size:int;
        private var _reservedNumbers:Array;
        private var _freeNumbers:Array;

        public function NumberBank(k:int);

        public function dispose():void;

        public function reserveNumber():int;

        public function freeNumber(k:int):void;


    }
}//package com.sulake.room.utils

