//com.sulake.core.communication.wireformat.IWireFormat

package com.sulake.core.communication.wireformat{
    import flash.utils.ByteArray;

    public /*dynamic*/ interface IWireFormat {

        function dispose():void;
        function encode(k:int, _arg_2:Array):ByteArray;
        function splitMessages(k:ByteArray):Array;

    }
}//package com.sulake.core.communication.wireformat

