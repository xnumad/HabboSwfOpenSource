package com.sulake.core.window.utils
{
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.core.utils.Map;
    import flash.utils.getQualifiedClassName;

    public class PropertyStruct 
    {
        public static const HEX:String = "hex";
        public static const INT:String = "int";
        public static const UINT:String = "uint";
        public static const NUMBER:String = "Number";
        public static const BOOLEAN:String = "Boolean";
        public static const STRING:String = "String";
        public static const POINT:String = "Point";
        public static const RECTANGLE:String = "Rectangle";
        public static const ARRAY:String = "Array";
        public static const MAP:String = "Map";

        private var _key:String;
        private var _value:Object;
        private var _type:String;
        private var _valid:Boolean;
        private var _complex:Boolean;
        private var _range:Array;

        public function PropertyStruct(key:String, value:Object, type:String, valid:Boolean=false, range:Array=null)
        {
            this._key = key;
            this._value = value;
            this._type = type;
            this._valid = valid;
            this._complex = ((((type == MAP) || (type == ARRAY)) || (type == POINT)) || (type == RECTANGLE));
            this._range = range;
        }

        public function get key():String
        {
            return this._key;
        }

        public function get value():Object
        {
            return this._value;
        }

        public function get type():String
        {
            return this._type;
        }

        public function get valid():Boolean
        {
            return this._valid;
        }

        public function get range():Array
        {
            return this._range;
        }

        public function withNameSpace(k:String):PropertyStruct
        {
            return new PropertyStruct(((k + ":") + this._key), this._value, this._type, this._valid, this._range);
        }

        public function withoutNameSpace():PropertyStruct
        {
            return new PropertyStruct(this._key.replace(/.*:/, ""), this._value, this._type, this._valid, this._range);
        }

        public function withValue(k:Object):PropertyStruct
        {
            var _local_3:Array;
            var _local_4:Array;
            var _local_5:int;
            var _local_2:Boolean = true;
            switch (this._type)
            {
                case UINT:
                case HEX:
                    _local_2 = (!(uint(this._value) == uint(k)));
                    break;
                case INT:
                    _local_2 = (!(int(this._value) == int(k)));
                    break;
                case NUMBER:
                    _local_2 = (!(Number(this._value) == Number(k)));
                    break;
                case BOOLEAN:
                    _local_2 = (!(Boolean(this._value) == Boolean(k)));
                    break;
                case STRING:
                    _local_2 = (!(String(this._value) == String(k)));
                    break;
                case ARRAY:
                    _local_3 = (this._value as Array);
                    _local_4 = (k as Array);
                    if ((((!(_local_3 == null)) && (!(_local_4 == null))) && (_local_3.length == _local_4.length)))
                    {
                        _local_2 = false;
                        _local_5 = 0;
                        while (_local_5 < _local_4.length)
                        {
                            if (_local_3[_local_5] != _local_4[_local_5])
                            {
                                _local_2 = true;
                                break;
                            }
                            _local_5++;
                        }
                    }
                    break;
            }
            if (_local_2)
            {
                return new PropertyStruct(this._key, k, this.type, true, this._range);
            }
            return this;
        }

        public function toString():String
        {
            switch (this._type)
            {
                case HEX:
                    return "0x" + uint(this._value).toString(16);
                case BOOLEAN:
                    return (Boolean(this._value) == true) ? "true" : "false";
                case POINT:
                    return ((("Point(" + Point(this._value).x) + ", ") + Point(this._value).y) + ")";
                case RECTANGLE:
                    return ((((((("Rectangle(" + Rectangle(this._value).x) + ", ") + Rectangle(this._value).y) + ", ") + Rectangle(this._value).width) + ", ") + Rectangle(this._value).height) + ")";
            }
            return String(this.value);
        }

        public function toXMLString():String
        {
            var k:String;
            var _local_2:int;
            var _local_3:Map;
            var _local_4:Array;
            var _local_5:Point;
            var _local_6:Rectangle;
            switch (this._type)
            {
                case MAP:
                    _local_3 = (this._value as Map);
                    k = (((('<var key="' + this._key) + '">\r<value>\r<') + this._type) + ">\r");
                    _local_2 = 0;
                    while (_local_2 < _local_3.length)
                    {
                        k = (k + (((((('<var key="' + _local_3.getKey(_local_2)) + '" value="') + _local_3.getWithIndex(_local_2)) + '" type="') + getQualifiedClassName(_local_3.getWithIndex(_local_2))) + '" />\r'));
                        _local_2++;
                    }
                    k = (k + (("</" + this._type) + ">\r</value>\r</var>"));
                    break;
                case ARRAY:
                    _local_4 = (this._value as Array);
                    k = (((('<var key="' + this._key) + '">\r<value>\r<') + this._type) + ">\r");
                    _local_2 = 0;
                    while (_local_2 < _local_4.length)
                    {
                        k = (k + (((((('<var key="' + String(_local_2)) + '" value="') + _local_4[_local_2]) + '" type="') + getQualifiedClassName(_local_4[_local_2])) + '" />\r'));
                        _local_2++;
                    }
                    k = (k + (("</" + this._type) + ">\r</value>\r</var>"));
                    break;
                case POINT:
                    _local_5 = (this._value as Point);
                    k = (((('<var key="' + this._key) + '">\r<value>\r<') + this._type) + ">\r");
                    k = (k + (((('<var key="x" value="' + _local_5.x) + '" type="') + INT) + '" />\r'));
                    k = (k + (((('<var key="y" value="' + _local_5.y) + '" type="') + INT) + '" />\r'));
                    k = (k + (("</" + this._type) + ">\r</value>\r</var>"));
                    break;
                case RECTANGLE:
                    _local_6 = (this._value as Rectangle);
                    k = (((('<var key="' + this._key) + '">\r<value>\r<') + this._type) + ">\r");
                    k = (k + (((('<var key="x" value="' + _local_6.x) + '" type="') + INT) + '" />\r'));
                    k = (k + (((('<var key="y" value="' + _local_6.y) + '" type="') + INT) + '" />\r'));
                    k = (k + (((('<var key="width" value="' + _local_6.width) + '" type="') + INT) + '" />\r'));
                    k = (k + (((('<var key="height" value="' + _local_6.height) + '" type="') + INT) + '" />\r'));
                    k = (k + (("</" + this._type) + ">\r</value>\r</var>"));
                    break;
                case HEX:
                    k = ((((((('<var key="' + this._key) + '" value="') + "0x") + uint(this._value).toString(16)) + '" type="') + this._type) + '" />');
                    break;
                default:
                    k = (((((('<var key="' + this._key) + '" value="') + this._value) + '" type="') + this._type) + '" />');
            }
            return k;
        }
    }
}
