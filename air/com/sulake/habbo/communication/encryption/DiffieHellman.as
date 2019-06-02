//com.sulake.habbo.communication.encryption.DiffieHellman

package com.sulake.habbo.communication.encryption{
    import com.sulake.core.communication.handshake.IKeyExchange;
    import com.hurlant.math.BigInteger;

    public class DiffieHellman implements IKeyExchange {

        private var _privateKey:BigInteger;
        private var _publicKey:BigInteger;
        private var _compositeKey:BigInteger;
        private var _sharedKey:BigInteger;
        private var _prime:BigInteger;
        private var _generator:BigInteger;

        public function DiffieHellman(k:BigInteger, _arg_2:BigInteger);

        public function init(k:String, _arg_2:uint=16):Boolean;

        public function generateSharedKey(k:String, _arg_2:uint=16):String;

        public function getPublicKey(k:uint=16):String;

        public function getSharedKey(k:uint=16):String;


    }
}//package com.sulake.habbo.communication.encryption

