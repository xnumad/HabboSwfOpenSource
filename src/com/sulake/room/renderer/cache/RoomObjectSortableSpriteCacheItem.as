package com.sulake.room.renderer.cache
{
    import com.sulake.room.renderer.utils.SortableSprite;

    public class RoomObjectSortableSpriteCacheItem 
    {
        private var _Str_1786:Array;
        private var _updateId1:int = -1;
        private var _updateId2:int = -1;
        private var _isEmpty:Boolean = false;

        public function RoomObjectSortableSpriteCacheItem()
        {
            this._Str_1786 = [];
            super();
        }

        public function get _Str_3008():int
        {
            return this._Str_1786.length;
        }

        public function get isEmpty():Boolean
        {
            return this._isEmpty;
        }

        public function dispose():void
        {
            this._Str_20276(0);
        }

        public function _Str_12937(k:SortableSprite):void
        {
            this._Str_1786.push(k);
        }

        public function _Str_2505(k:int):SortableSprite
        {
            return this._Str_1786[k];
        }

        public function get _Str_9272():Array
        {
            return this._Str_1786;
        }

        public function _Str_17574(k:int, _arg_2:int):Boolean
        {
            if (((!(k == this._updateId1)) || (!(_arg_2 == this._updateId2))))
            {
                this._updateId1 = k;
                this._updateId2 = _arg_2;
                return true;
            }
            return false;
        }

        public function _Str_20276(k:int):void
        {
            var _local_2:int;
            var _local_3:SortableSprite;
            if (k < this._Str_1786.length)
            {
                _local_2 = k;
                while (_local_2 < this._Str_1786.length)
                {
                    _local_3 = this._Str_1786[_local_2];
                    if (_local_3)
                    {
                        _local_3.dispose();
                    }
                    _local_2++;
                }
                this._Str_1786.splice(k, (this._Str_1786.length - k));
            }
            if (this._Str_1786.length == 0)
            {
                this._isEmpty = true;
            }
            else
            {
                this._isEmpty = false;
            }
        }
    }
}
