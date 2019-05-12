package com.probertson.utils
{
    import flash.utils.ByteArray;

    public class CRC32Generator 
    {
        private static var _crcTable:Array;
        private static var _tableComputed:Boolean = false;


        private static function makeCRCTable():void
        {
            _crcTable = new Array(256);
			var val:uint;
			for (var i:int = 0; i < 256; i++)
			{
				val = i;
				for (var j:int = 0; j < 8; j++)
				{
					if ((val & 1) != 0)
					{
						val = 0xedb88320 ^ (val >>> 1);
					}
					else
					{
						val = val >>> 1;
					}
				}
				_crcTable[i] = val;
			}
			_tableComputed = true;
        }


        public function generateCRC32(buffer:ByteArray):uint
        {
            if (!_tableComputed)
			{
				makeCRCTable();
			}
			var result:uint = ~0;
			var len:int = buffer.length;
			for (var i:int = 0; i < len; i++)
			{
				result = _crcTable[(result ^ buffer[i]) & 0xff] ^ (result >>> 8);
			}
			result = ~result;
			
			return (result & 0xffffffff);
        }
    }
}
