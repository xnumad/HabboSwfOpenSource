package com.sulake.core.communication.util
{
    import flash.utils.ByteArray;

    public class Short 
    {
        private var ba:ByteArray;

        public function Short(value:int)
        {
            this.ba = new ByteArray();
            this.ba.writeShort(value);
            this.ba.position = 0;
        }

        public function get value():int
        {
            var value:int;
            this.ba.position = 0;
            if (this.ba.bytesAvailable)
            {
                value = this.ba.readShort();
                this.ba.position = 0;
            }
            return value;
        }
    }
}
