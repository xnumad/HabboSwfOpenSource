package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7089 
    {
        private var _images:Array;
        private var _texts:Array;

        public function _Str_7089(k:IMessageDataWrapper)
        {
            this._images = new Array();
            this._texts = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._images.push(k.readString());
                _local_3++;
            }
            var _local_4:int = k.readInteger();
            var _local_5:int;
            while (_local_5 < _local_4)
            {
                this._texts.push(k.readString());
                _local_5++;
            }
        }

        public function get images():Array
        {
            return this._images;
        }

        public function get texts():Array
        {
            return this._texts;
        }
    }
}
