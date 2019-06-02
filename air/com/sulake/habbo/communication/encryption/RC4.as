//com.sulake.habbo.communication.encryption.RC4

package com.sulake.habbo.communication.encryption{
    import com.sulake.core.communication.encryption.IEncryption;
    import flash.utils.ByteArray;

    public class RC4 implements IEncryption {

        private var i:uint;
        private var j:uint;
        private var sbox:Array;

        public function RC4();

        public function init(k:ByteArray):void;

        public function initFromState(k:IEncryption):void;

        public function encipher(k:ByteArray, _arg_2:Boolean=false):ByteArray;

        protected function customHackScramble(k:Array, _arg_2:int, _arg_3:int):void;

        public function decipher(k:ByteArray):ByteArray;

        protected function swap(k:uint, _arg_2:uint):void;


    }
}//package com.sulake.habbo.communication.encryption

