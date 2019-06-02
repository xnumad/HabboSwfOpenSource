package com.sulake.room.renderer.cache
{
    import com.sulake.room.renderer.utils.SortableSprite;

    public class RoomObjectSortableSpriteCacheItem 
    {
        private var _layersInUse:Array;
        private var _updateId1:int = -1;
        private var _updateId2:int = -1;
        private var _isEmpty:Boolean = false;

        public function RoomObjectSortableSpriteCacheItem()
        {
            this._layersInUse = [];
            super();
        }

        public function get spriteCount():int
        {
            return this._layersInUse.length;
        }

        public function get isEmpty():Boolean
        {
            return this._isEmpty;
        }

        public function dispose():void
        {
            this.setSpriteCount(0);
        }

        public function addSprite(k:SortableSprite):void
        {
            this._layersInUse.push(k);
        }

        public function getSprite(k:int):SortableSprite
        {
            return this._layersInUse[k];
        }

        public function get sprites():Array
        {
            return this._layersInUse;
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

        public function setSpriteCount(k:int):void
        {
            var _local_2:int;
            var _local_3:SortableSprite;
            if (k < this._layersInUse.length)
            {
                _local_2 = k;
                while (_local_2 < this._layersInUse.length)
                {
                    _local_3 = this._layersInUse[_local_2];
                    if (_local_3)
                    {
                        _local_3.dispose();
                    }
                    _local_2++;
                }
                this._layersInUse.splice(k, (this._layersInUse.length - k));
            }
            if (this._layersInUse.length == 0)
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
