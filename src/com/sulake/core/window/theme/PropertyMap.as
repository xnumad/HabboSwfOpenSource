package com.sulake.core.window.theme
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.utils.*;

    public class PropertyMap implements IPropertyMap 
    {
        private var _map:Dictionary;

        public function PropertyMap()
        {
            this._map = new Dictionary();
            super();
        }

        private function add(key:String, value:Object, type:String, range:Array=null):void
        {
            this._map[key] = new PropertyStruct(key, value, type, false, range);
        }

        public function addBoolean(key:String, value:Boolean):void
        {
            this.add(key, value, PropertyStruct.BOOLEAN);
        }

        public function addInt(key:String, value:int):void
        {
            this.add(key, value, PropertyStruct.INT);
        }

        public function addUint(key:String, value:uint):void
        {
            this.add(key, value, PropertyStruct.UINT);
        }

        public function addHex(key:String, value:uint):void
        {
            this.add(key, value, PropertyStruct.HEX);
        }

        public function addNumber(key:String, value:Number):void
        {
            this.add(key, value, PropertyStruct.NUMBER);
        }

        public function addString(key:String, value:String):void
        {
            this.add(key, value, PropertyStruct.STRING);
        }

        public function addEnumeration(key:String, value:String, range:Array):void
        {
            this.add(key, value, PropertyStruct.STRING, range);
        }

        public function addArray(key:String, value:Array):void
        {
            this.add(key, value, PropertyStruct.ARRAY);
        }

        public function get(key:String):PropertyStruct
        {
            return this._map[key];
        }

        public function clone():PropertyMap
        {
            var copy:PropertyMap = new PropertyMap();
            for (var key:String in this._map)
            {
                copy._map[key] = this._map[key];
            }
            return copy;
        }
    }
}
