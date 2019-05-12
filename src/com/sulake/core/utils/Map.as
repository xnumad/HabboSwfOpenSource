package com.sulake.core.utils
{
    import flash.utils.Proxy;
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    public class Map extends Proxy implements IDisposable 
    {
        private var _length:uint;
        private var _dictionary:Dictionary;
        private var _array:Array;
        private var _keys:Array;

        public function Map()
        {
            this._length = 0;
            this._dictionary = new Dictionary();
            this._array = [];
            this._keys = [];
        }

        public function get length():uint
        {
            return this._length;
        }

        public function get disposed():Boolean
        {
            return this._dictionary == null;
        }

        public function dispose():void
        {
            if (this._dictionary != null)
            {
                for (var key:Object in this._dictionary)
                {
                    delete this._dictionary[key];
                }
                this._dictionary = null;
            }
            this._length = 0;
            this._array = null;
            this._keys = null;
        }

        public function reset():void
        {
            for (var key:Object in this._dictionary)
            {
                delete this._dictionary[key];
            }
            this._length = 0;
            this._array = [];
            this._keys = [];
        }

        public function unshift(key:*, value:*):Boolean
        {
            if (this._dictionary[key] != null)
            {
                return false;
            }
            this._dictionary[key] = value;
            this._array.unshift(value);
            this._keys.unshift(key);
            this._length++;
            return true;
        }

        public function add(key:*, value:*):Boolean
        {
            if (this._dictionary[key] != null)
            {
                return false;
            }
            this._dictionary[key] = value;
            this._array[this._length] = value;
            this._keys[this._length] = key;
            this._length++;
            return true;
        }

        public function remove(key:*):*
        {
            var value:Object = this._dictionary[key];
            if (value == null)
            {
                return null;
            }
            var objectIndex:int = this._array.indexOf(value);
            if (objectIndex >= 0)
            {
                this._array.splice(objectIndex, 1);
                this._keys.splice(objectIndex, 1);
                this._length--;
            }
            delete this._dictionary[key];
            return value;
        }

        public function getWithIndex(index:int):*
        {
            if (((index < 0) || (index >= this._length)))
            {
                return null;
            }
            return this._array[index];
        }

        public function getKey(index:int):*
        {
            if (((index < 0) || (index >= this._length)))
            {
                return null;
            }
            return this._keys[index];
        }

        public function getKeys():Array
        {
            return this._keys.slice();
        }

        public function hasKey(key:*):Boolean
        {
            return this._keys.indexOf(key) > -1;
        }

        public function getValue(key:*):*
        {
            return this._dictionary[key];
        }

        public function getValues():Array
        {
            return this._array.slice();
        }

        public function hasValue(value:*):Boolean
        {
            return this._array.indexOf(value) > -1;
        }

        public function indexOf(value:*):int
        {
            return this._array.indexOf(value);
        }

        public function concatenate(newValues:Map):void
        {
            for each (var key:* in newValues._keys)
            {
                this.add(key, newValues[key]);
            }
        }

        public function clone():Map
        {
            var copy:Map = new Map();
            copy.concatenate(this);
            return copy;
        }

        override flash_proxy function getProperty(key:*):*
        {
            if ((key is QName))
            {
                key = QName(key).localName;
            }
            return this._dictionary[key];
        }

        override flash_proxy function setProperty(key:*, value:*):void
        {
            if ((key is QName))
            {
                key = QName(key).localName;
            }
            this._dictionary[key] = value;
            var _local_3:int = this._keys.indexOf(key);
            if (_local_3 == -1)
            {
                this._array[this._length] = value;
                this._keys[this._length] = key;
                this._length++;
            }
            else
            {
                this._array.splice(_local_3, 1, value);
            }
        }

        override flash_proxy function nextNameIndex(index:int):int
        {
            return (index < this._length) ? (index + 1) : 0;
        }

        override flash_proxy function nextName(index:int):String
        {
            return this._keys[(index - 1)];
        }

        override flash_proxy function nextValue(index:int):*
        {
            return this._array[(index - 1)];
        }

        override flash_proxy function callProperty(property:*, ... _args):*
        {
            return (property.localName == "toString") ? "Map" : null;
        }
    }
}
