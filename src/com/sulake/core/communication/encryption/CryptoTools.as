package com.sulake.core.communication.encryption
{
    import flash.utils.ByteArray;

    public class CryptoTools 
    {
        public static function byteArrayToString(input:ByteArray):String
        {
            input.position = 0;
            var output:String = "";
            while (input.bytesAvailable)
            {
                output = (output + String.fromCharCode(input.readByte()));
            }
            return output;
        }

        public static function stringToByteArray(input:String):ByteArray
        {
            var buffer:ByteArray = new ByteArray();
			for (var index:int = 0; index < input.length; index++)
            {
                buffer.writeByte(input.charCodeAt(index));
            }
            buffer.position = 0;
            return buffer;
        }

        public static function byteArrayToHexString(input:ByteArray, toUpperCase:Boolean=false):String
        {
            var byte:uint;
            var a:uint;
            var b:uint;
            input.position = 0;
            var output:String = "";
            while (input.bytesAvailable)
            {
                byte = input.readUnsignedByte();
                a = (byte >> 4);
                b = (byte & 0x0F);
                output = (output + a.toString(16));
                output = (output + b.toString(16));
            }
            if (toUpperCase)
            {
                output = output.toUpperCase();
            }
            return output;
        }

        public static function hexStringToByteArray(input:String):ByteArray
        {
            var a:int;
            var b:int;
            var byte:int;
            var buffer:ByteArray = new ByteArray();
            if ((input.length % 2) != 0)
            {
                input = ("0" + input);
            }
            var bytesRead:int;
            while (bytesRead < (input.length - 1))
            {
                a = parseInt(input.charAt((bytesRead + 0)), 16);
                b = parseInt(input.charAt((bytesRead + 1)), 16);
                byte = ((a << 4) | b);
                buffer.writeByte(byte);
                bytesRead++;
                bytesRead++;
            }
            return buffer;
        }

        public static function BigIntegerToRadix(input:ByteArray, _arg_2:uint=16):String
        {
            return "";
        }

        public static function fletcher100(input:ByteArray, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int = _arg_2;
            var _local_5:int = _arg_3;
            var counter:int;
            while (counter < input.length)
            {
                _local_4 = ((_local_4 + input[counter]) % 0xFF);
                _local_5 = ((_local_4 + _local_5) % 0xFF);
                counter++;
            }
            return (_local_4 + _local_5) % 100;
        }
    }
}
