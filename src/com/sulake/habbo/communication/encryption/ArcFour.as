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
        private var sbox:Vector.<uint>;
        private var markI:uint;
        private var markJ:uint;
        private var markBox:Vector.<uint>;

        public function ArcFour()
        {
            this.sbox = new Vector.<uint>();
        }

        public function init(k:ByteArray):void
        {
            var _local_3:uint;
            var _local_2:uint = k.length;
            this.i = 0;
            while (this.i < 0x0100)
            {
                this.sbox[this.i] = this.i;
                this.i++;
            }
            this.j = 0;
            this.i = 0;
            while (this.i < 0x0100)
            {
                this.j = (((this.j + this.sbox[this.i]) + k[(this.i % _local_2)]) % 0x0100);
                _local_3 = this.sbox[this.i];
                this.sbox[this.i] = this.sbox[this.j];
                this.sbox[this.j] = _local_3;
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
                this.j = ((this.j + this.sbox[this.i]) % 0x0100);
                _local_3 = this.sbox[this.i];
                this.sbox[this.i] = this.sbox[this.j];
                this.sbox[this.j] = _local_3;
                _local_4 = ((this.sbox[this.i] + this.sbox[this.j]) % 0x0100);
                _local_2.writeByte((this.sbox[_local_4] ^ k.readByte()));
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
                this.j = ((this.j + this.sbox[this.i]) & 0xFF);
                _local_3 = this.sbox[this.i];
                this.sbox[this.i] = this.sbox[this.j];
                this.sbox[this.j] = _local_3;
                _local_4 = this.sbox[((this.sbox[this.i] + this.sbox[this.j]) & 0xFF)];
                _local_2.writeByte((k.readByte() ^ _local_4));
            }
            _local_2.position = 0;
            return _local_2;
        }

        public function mark():void
        {
            this.markI = this.i;
            this.markJ = this.j;
            this.markBox = this.sbox.concat();
        }

        public function reset():void
        {
            this.i = this.markI;
            this.j = this.markJ;
            this.sbox = this.markBox.concat();
        }
    }
}
