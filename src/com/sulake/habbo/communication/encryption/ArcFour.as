package com.sulake.habbo.communication.encryption
{
    import com.sulake.core.communication.encryption.IEncryption;
    import __AS3__.vec.Vector;
    import flash.utils.ByteArray;
    import __AS3__.vec.*;

    public class ArcFour implements IEncryption 
    {
        private var i:uint = 0;
        private var j:uint = 0;
        private var _Str_3150:Vector.<uint>;
        private var _Str_20933:uint;
        private var _Str_22001:uint;
        private var _Str_21636:Vector.<uint>;

        public function ArcFour()
        {
            this._Str_3150 = new Vector.<uint>();
        }

        public function init(k:ByteArray):void
        {
            var _local_3:uint;
            var _local_2:uint = k.length;
            this.i = 0;
            while (this.i < 0x0100)
            {
                this._Str_3150[this.i] = this.i;
                this.i++;
            }
            this.j = 0;
            this.i = 0;
            while (this.i < 0x0100)
            {
                this.j = (((this.j + this._Str_3150[this.i]) + k[(this.i % _local_2)]) % 0x0100);
                _local_3 = this._Str_3150[this.i];
                this._Str_3150[this.i] = this._Str_3150[this.j];
                this._Str_3150[this.j] = _local_3;
                this.i++;
            }
            this.i = 0;
            this.j = 0;
        }

        public function encipher(k:ByteArray):ByteArray
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_2:ByteArray = new ByteArray();
            k.position = 0;
            while (k.bytesAvailable)
            {
                this.i = ((this.i + 1) % 0x0100);
                this.j = ((this.j + this._Str_3150[this.i]) % 0x0100);
                _local_3 = this._Str_3150[this.i];
                this._Str_3150[this.i] = this._Str_3150[this.j];
                this._Str_3150[this.j] = _local_3;
                _local_4 = ((this._Str_3150[this.i] + this._Str_3150[this.j]) % 0x0100);
                _local_2.writeByte((this._Str_3150[_local_4] ^ k.readByte()));
            }
            _local_2.position = 0;
            return _local_2;
        }

        public function decipher(k:ByteArray):ByteArray
        {
            var _local_3:uint;
            var _local_4:uint;
            var _local_2:ByteArray = new ByteArray();
            k.position = 0;
            while (k.bytesAvailable)
            {
                this.i = ((this.i + 1) & 0xFF);
                this.j = ((this.j + this._Str_3150[this.i]) & 0xFF);
                _local_3 = this._Str_3150[this.i];
                this._Str_3150[this.i] = this._Str_3150[this.j];
                this._Str_3150[this.j] = _local_3;
                _local_4 = this._Str_3150[((this._Str_3150[this.i] + this._Str_3150[this.j]) & 0xFF)];
                _local_2.writeByte((k.readByte() ^ _local_4));
            }
            _local_2.position = 0;
            return _local_2;
        }

        public function mark():void
        {
            this._Str_20933 = this.i;
            this._Str_22001 = this.j;
            this._Str_21636 = this._Str_3150.concat();
        }

        public function reset():void
        {
            this.i = this._Str_20933;
            this.j = this._Str_22001;
            this._Str_3150 = this._Str_21636.concat();
        }
    }
}
