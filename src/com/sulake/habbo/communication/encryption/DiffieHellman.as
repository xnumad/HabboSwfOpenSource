package com.sulake.habbo.communication.encryption
{
    import _Str_538._Str_9612;
    import com.hurlant.math.BigInteger;

    public class DiffieHellman implements _Str_9612 
    {
        private var _privateKey:BigInteger;
        private var _publicKey:BigInteger;
        private var _serverPublicKey:BigInteger;
        private var _sharedKey:BigInteger;
        private var _prime:BigInteger;
        private var _generator:BigInteger;
        private var _minimumPublicKey:BigInteger;
        private var _minimumSharedSecret:BigInteger;

        public function DiffieHellman(k:BigInteger, _arg_2:BigInteger)
        {
            this._minimumPublicKey = BigInteger.nbv(2);
            this._minimumSharedSecret = BigInteger.nbv(2);
            super();
            this._prime = k;
            this._generator = _arg_2;
        }

        public function init(k:String, _arg_2:uint=16):Boolean
        {
            this._privateKey = new BigInteger();
            this._privateKey.fromRadix(k, _arg_2);
            this._publicKey = this._generator.modPow(this._privateKey, this._prime);
            return true;
        }

        public function _Str_21719(k:String, _arg_2:uint=16):String
        {
            this._serverPublicKey = new BigInteger();
            this._serverPublicKey.fromRadix(k, _arg_2);
            this._sharedKey = this._serverPublicKey.modPow(this._privateKey, this._prime);
            return this._Str_16542(_arg_2);
        }

        public function _Str_19483(k:uint=16):String
        {
            return this._publicKey.toRadix(k);
        }

        public function _Str_16542(k:uint=16):String
        {
            return this._sharedKey.toRadix(k);
        }

        public function _Str_20000():Boolean
        {
            return this._serverPublicKey.compareTo(this._minimumPublicKey) >= 0;
        }

        public function _Str_21716():Boolean
        {
            return this._sharedKey.compareTo(this._minimumSharedSecret) >= 0;
        }
    }
}
