package com.sulake.room.renderer.cache
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.renderer.utils.ExtendedBitmapData;
    import flash.display.BitmapData;

    public class BitmapDataCache 
    {
        private var _dataMap:Map;
        private var _memUsage:int = 0;
        private var _memLimit:int = 0;
        private var _maxMemory:int = 0;
        private var _increaseSize:int = 0;

        public function BitmapDataCache(k:int, _arg_2:int, _arg_3:int=1)
        {
            this._dataMap = new Map();
            this._memLimit = ((k * 0x0400) * 0x0400);
            this._maxMemory = ((_arg_2 * 0x0400) * 0x0400);
            this._increaseSize = ((_arg_3 * 0x0400) * 0x0400);
            if (this._increaseSize < 0)
            {
                this._increaseSize = 0;
            }
        }

        public function get _Str_16106():int
        {
            return this._memUsage;
        }

        public function get memLimit():int
        {
            return this._memLimit;
        }

        public function dispose():void
        {
            var k:Array;
            var _local_2:String;
            if (this._dataMap != null)
            {
                k = this._dataMap.getKeys();
                for each (_local_2 in k)
                {
                    if (!this.removeItem(_local_2))
                    {
                        Logger.log((("Failed to remove item " + _local_2) + " from room canvas bitmap cache!"));
                    }
                }
                this._dataMap.dispose();
                this._dataMap = null;
            }
        }

        public function compress():void
        {
            var _local_3:Array;
            var k:BitmapDataCacheItem;
            var _local_2:int;
            if (this._Str_16106 > this.memLimit)
            {
                _local_3 = this._dataMap.getValues();
                _local_3.sortOn("useCount", (Array.DESCENDING | Array.NUMERIC));
                _local_2 = (_local_3.length - 1);
                while (_local_2 >= 0)
                {
                    k = (_local_3[_local_2] as BitmapDataCacheItem);
                    if (k.useCount <= 1)
                    {
                        this.removeItem(k.name);
                    }
                    else
                    {
                        break;
                    }
                    _local_2--;
                }
                this.increaseMemoryLimit();
            }
        }

        private function increaseMemoryLimit():void
        {
            this._memLimit = (this._memLimit + this._increaseSize);
            if (this._memLimit > this._maxMemory)
            {
                this._memLimit = this._maxMemory;
            }
        }

        private function removeItem(k:String):Boolean
        {
            if (k == null)
            {
                return false;
            }
            var _local_2:BitmapDataCacheItem = (this._dataMap.getValue(k) as BitmapDataCacheItem);
            if (_local_2 != null)
            {
                if (_local_2.useCount <= 1)
                {
                    this._dataMap.remove(_local_2.name);
                    this._memUsage = (this._memUsage - _local_2._Str_16106);
                    _local_2.dispose();
                    return true;
                }
                return false;
            }
            return false;
        }

        public function getBitmapData(k:String):ExtendedBitmapData
        {
            var _local_2:BitmapDataCacheItem = (this._dataMap.getValue(k) as BitmapDataCacheItem);
            if (_local_2 == null)
            {
                return null;
            }
            return _local_2.bitmapData;
        }

        public function addBitmapData(k:String, _arg_2:ExtendedBitmapData):void
        {
            var _local_4:BitmapData;
            if (_arg_2 == null)
            {
                return;
            }
            var _local_3:BitmapDataCacheItem = (this._dataMap.getValue(k) as BitmapDataCacheItem);
            if (_local_3 != null)
            {
                _local_4 = _local_3.bitmapData;
                if (_local_4 != null)
                {
                    this._memUsage = (this._memUsage - ((_local_4.width * _local_4.height) * 4));
                }
                _local_3.bitmapData = _arg_2;
            }
            else
            {
                _local_3 = new BitmapDataCacheItem(_arg_2, k);
                this._dataMap.add(k, _local_3);
            }
            this._memUsage = (this._memUsage + ((_arg_2.width * _arg_2.height) * 4));
        }
    }
}
