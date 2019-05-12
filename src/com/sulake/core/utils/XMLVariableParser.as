package com.sulake.core.utils
{
    import flash.geom.Point;
    import flash.geom.Rectangle;

    public class XMLVariableParser 
    {
        public static const HEX:String = "hex";
        public static const INT:String = "int";
        public static const UINT:String = "uint";
        public static const NUMBER:String = "Number";
        public static const FLOAT:String = "float";
        public static const BOOLEAN:String = "Boolean";
        public static const BOOL:String = "bool";
        public static const STRING:String = "String";
        public static const POINT:String = "Point";
        public static const RECTANGLE:String = "Rectangle";
        public static const ARRAY:String = "Array";
        public static const MAP:String = "Map";
        private static const KEY:String = "key";
        private static const TYPE:String = "type";
        private static const VALUE:String = "value";
        private static const TRUE:String = "true";
        private static const FALSE:String = "false";
        private static const X:String = "x";
        private static const Y:String = "y";
        private static const WIDTH:String = "width";
        private static const HEIGHT:String = "height";
        private static const COMMA:String = ",";


        public static function parseVariableList(k:XMLList, _arg_2:Map, _arg_3:Array=null):uint
        {
            var _local_5:uint;
            var _local_4:uint = k.length();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                XMLVariableParser.parseVariableToken(k[_local_5], _arg_2, _arg_3);
                _local_5++;
            }
            return _local_4;
        }

        private static function parseVariableToken(k:XML, _arg_2:Map, _arg_3:Array=null):void
        {
            var _local_4:String;
            var _local_6:String;
            var _local_7:XMLList;
            var _local_8:XML;
            var _local_9:XML;
            var _local_5:String = STRING;
            _local_7 = k.attribute(KEY);
            if (_local_7.length() > 0)
            {
                _local_4 = String(k.attribute(KEY));
            }
            else
            {
                _local_4 = k.child(KEY)[0];
            }
            _local_7 = k.attribute(TYPE);
            if (_local_7.length() > 0)
            {
                _local_5 = String(k.attribute(TYPE));
            }
            _local_7 = k.attribute(VALUE);
            if (_local_7.length() > 0)
            {
                _local_6 = String(k.attribute(VALUE));
            }
            if (_local_6 != null)
            {
                _arg_2[_local_4] = XMLVariableParser.castStringToType(_local_6, _local_5);
            }
            else
            {
                _local_8 = k.child(VALUE)[0];
                if (_local_8 != null)
                {
                    _local_9 = _local_8.child(0)[0];
                    _local_6 = _local_9.children()[0];
                    _local_5 = _local_9.localName();
                    _arg_2[_local_4] = XMLVariableParser.parseValueType(_local_9, _local_5);
                }
                else
                {
                    if (((_local_5 == MAP) || (_local_5 == ARRAY)))
                    {
                        _arg_2[_local_4] = XMLVariableParser.parseValueType(k, _local_5);
                    }
                }
            }
            if (_arg_3)
            {
                _arg_3.push(_local_5);
            }
        }

        public static function castStringToType(value:String, type:String):Object
        {
            switch (type)
            {
                case UINT:
                    return uint(value);
                case INT:
                    return int(value);
                case NUMBER:
                    return Number(value);
                case FLOAT:
                    return Number(value);
                case BOOLEAN:
                    return (value == TRUE) || (int(value) > 0);
                case BOOL:
                    return (value == TRUE) || (int(value) > 0);
                case HEX:
                    return uint(value);
                case ARRAY:
                    return value.split(COMMA);
                default:
                    return String(value);
            }
        }

        public static function parseValueType(xml:XML, type:String):Object
        {
            switch (type)
            {
                case STRING:
                    return String(xml);
                case POINT:
                    var point:Point = new Point();
                    point.x = Number(xml.attribute(X));
                    point.y = Number(xml.attribute(Y));
                    return point;
                case RECTANGLE:
                    var rect:Rectangle = new Rectangle();
                    rect.x = Number(xml.attribute(X));
                    rect.y = Number(xml.attribute(Y));
                    rect.width = Number(xml.attribute(WIDTH));
                    rect.height = Number(xml.attribute(HEIGHT));
                    return rect;
                case ARRAY:
                    var variableList:Map = new Map();
                    parseVariableList(xml.children(), variableList);
            		var list:Array = new Array();
                    for (var key:String in variableList)
                    {
                        list.push(variableList[key]);
                    }
                    return list;
                case MAP:
                    var map:Map = new Map();
                    XMLVariableParser.parseVariableList(xml.children(), map);
                    return map;
            }
            throw (new Error((('Unable to parse data type "' + type) + '", unknown type!')));
        }
    }
}
