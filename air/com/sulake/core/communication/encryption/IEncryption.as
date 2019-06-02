//com.sulake.core.communication.encryption.IEncryption

package com.sulake.core.communication.encryption{
    import flash.utils.ByteArray;

    public /*dynamic*/ interface IEncryption {

        function init(k:ByteArray):void;
        function initFromState(k:IEncryption):void;
        function encipher(k:ByteArray, _arg_2:Boolean=false):ByteArray;
        function decipher(k:ByteArray):ByteArray;

    }
}//package com.sulake.core.communication.encryption

