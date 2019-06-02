//com.sulake.core.communication.wireformat.EvaMessageDataWrapper

package com.sulake.core.communication.wireformat{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import flash.utils.ByteArray;

    final class EvaMessageDataWrapper implements IMessageDataWrapper {

        private var _id:int;
        private var _data:ByteArray;

        public function EvaMessageDataWrapper(k:int, _arg_2:ByteArray);

        public function getID():int;

        public function readString():String;

        public function readInteger():int;

        public function readBoolean():Boolean;

        public function readShort():int;

        public function readByte():int;

        public function readFloat():Number;

        public function get bytesAvailable():uint;

        public function toString():String;


    }
}//package com.sulake.core.communication.wireformat

