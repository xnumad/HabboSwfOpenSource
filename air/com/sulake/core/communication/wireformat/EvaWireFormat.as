//com.sulake.core.communication.wireformat.EvaWireFormat

package com.sulake.core.communication.wireformat{
    import flash.utils.ByteArray;

    public final class EvaWireFormat implements IWireFormat {

        private static const MAX_DATA:uint;

        public function EvaWireFormat();

        public function dispose():void;

        public function encode(k:int, _arg_2:Array):ByteArray;

        public function splitMessages(k:ByteArray):Array;


    }
}//package com.sulake.core.communication.wireformat

