package com.sulake.core.communication.wireformat
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import flash.utils.ByteArray;
    import com.hurlant.util.Hex;

    internal final class EvaMessageDataWrapper implements IMessageDataWrapper 
    {
        private var _id:int;
        private var _data:ByteArray;

        public function EvaMessageDataWrapper(k:int, _arg_2:ByteArray)
        {
            this._id = k;
            this._data = _arg_2;
        }

        public function getID():int
        {
            return this._id;
        }

        public function readString():String
        {
            return this._data.readUTF();
        }

        public function readInteger():int
        {
            return this._data.readInt();
        }

        public function readBoolean():Boolean
        {
            return this._data.readBoolean();
        }

        public function readShort():int
        {
            return this._data.readShort();
        }

        public function readByte():int
        {
            return this._data.readByte();
        }

        public function readFloat():Number
        {
            return this._data.readFloat();
        }

        public function readDouble():Number
        {
            return this._data.readDouble();
        }

        public function get bytesAvailable():uint
        {
            return this._data.bytesAvailable;
        }

        public function toString():String
        {
            return (((("id=" + this._id) + ", pos=") + this._data.position) + ", data=") + Hex.fromArray(this._data, true);
        }
    }
}
