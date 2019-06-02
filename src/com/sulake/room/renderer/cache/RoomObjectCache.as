package com.sulake.room.renderer.cache
{
    import com.sulake.core.utils.Map;
    import com.sulake.room.renderer.utils.SortableSprite;
    import com.sulake.room.data.RoomObjectSpriteData;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.enum.RoomObjectSpriteType;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.habbo.utils.Canvas;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import __AS3__.vec.*;

    public class RoomObjectCache 
    {
        private static const _Str_14703:int = 200;

        private var _data:Map = null;
        private var _roomObjectVariableAccurateZ:String = "";

        public function RoomObjectCache(k:String)
        {
            this._roomObjectVariableAccurateZ = k;
            this._data = new Map();
        }

        public function dispose():void
        {
            var k:int;
            var _local_2:RoomObjectCacheItem;
            if (this._data != null)
            {
                k = 0;
                while (k < this._data.length)
                {
                    _local_2 = (this._data.getWithIndex(k) as RoomObjectCacheItem);
                    if (_local_2 != null)
                    {
                        _local_2.dispose();
                    }
                    k++;
                }
                this._data.dispose();
                this._data = null;
            }
        }

        public function getObjectCache(k:String):RoomObjectCacheItem
        {
            var _local_2:RoomObjectCacheItem = (this._data.getValue(k) as RoomObjectCacheItem);
            if (_local_2 == null)
            {
                _local_2 = new RoomObjectCacheItem(this._roomObjectVariableAccurateZ);
                this._data.add(k, _local_2);
            }
            return _local_2;
        }

        public function removeObjectCache(k:String):void
        {
            var _local_2:RoomObjectCacheItem = (this._data.remove(k) as RoomObjectCacheItem);
            if (_local_2 != null)
            {
                _local_2.dispose();
            }
        }

        public function _Str_15625():Vector.<RoomObjectSpriteData>
        {
            var _local_3:RoomObjectCacheItem;
            var _local_4:SortableSprite;
            var _local_5:RoomObjectSpriteData;
            var _local_6:Boolean;
            var k:Vector.<RoomObjectSpriteData> = new Vector.<RoomObjectSpriteData>();
            var _local_2:Array = this._data.getValues();
            for each (_local_3 in _local_2)
            {
                for each (_local_4 in _local_3.sprites.sprites)
                {
                    if (((!(_local_4.sprite._Str_4918 == RoomObjectSpriteType.ROOM_PLANE)) && (!(_local_4.sprite._Str_3582 == ""))))
                    {
                        _local_5 = new RoomObjectSpriteData();
                        _local_5._Str_1577 = _local_3._Str_1577;
                        _local_5.x = _local_4.x;
                        _local_5.y = _local_4.y;
                        _local_5.z = _local_4.z;
                        _local_5.name = StringUtil._Str_25429(_local_4.sprite._Str_3582);
                        _local_5.flipH = _local_4.sprite.flipH;
                        _local_5.alpha = _local_4.sprite.alpha;
                        _local_5.color = _local_4.sprite.color.toString();
                        _local_5.blendMode = _local_4.sprite.blendMode;
                        _local_5.width = _local_4.sprite.width;
                        _local_5.height = _local_4.sprite.height;
                        _local_5.objectType = _local_4.sprite.objectType;
                        _local_5.posture = _local_4.sprite._Str_8401;
                        _local_6 = this._Str_23710(_local_4.sprite);
                        if (_local_6)
                        {
                            _local_5.skew = (((_local_4.sprite.direction % 4) == 0) ? -0.5 : 0.5);
                        }
                        if ((((((_local_6) || (_local_5.name.indexOf("%image.library.url%") >= 0)) || (_local_5.name.indexOf("%group.badge.url%") >= 0)) && (_local_5.width <= _Str_14703)) && (_local_5.height <= _Str_14703)))
                        {
                            _local_5.color = Canvas._Str_23439(_local_4.sprite.asset).toString();
                            if (_local_4.sprite.objectType.indexOf("external_image_wallitem") == 0)
                            {
                                _local_5.frame = true;
                            }
                        }
                        k.push(_local_5);
                    }
                }
            }
            return k;
        }

        private function _Str_23710(k:IRoomObjectSprite):Boolean
        {
            if (!k.objectType)
            {
                return false;
            }
            if (((k.objectType.indexOf("external_image_wallitem") == 0) && (k.tag == "THUMBNAIL")))
            {
                return true;
            }
            if (((k.objectType.indexOf("guild_forum") == 0) && (k.tag == "THUMBNAIL")))
            {
                return true;
            }
            return false;
        }

        public function _Str_14588():Array
        {
            var _local_3:RoomObjectCacheItem;
            var _local_4:SortableSprite;
            var k:Array = [];
            var _local_2:Array = this._data.getValues();
            for each (_local_3 in _local_2)
            {
                for each (_local_4 in _local_3.sprites.sprites)
                {
                    if (_local_4.sprite._Str_4918 == RoomObjectSpriteType.ROOM_PLANE)
                    {
                        k.push(_local_4);
                    }
                }
            }
            return k;
        }
    }
}
