package com.sulake.core.window.utils
{
    import com.sulake.core.utils.XMLVariableParser;
    import com.sulake.core.utils.Map;

    public class XMLPropertyArrayParser extends XMLVariableParser 
    {
        public static function parse(xmlList:XMLList):Array
        {
            var values:Map = new Map();
            var types:Array = new Array();
            var properties:Array = new Array();
            var variableCount:int = XMLVariableParser.parseVariableList(xmlList, values, types);
            var index:int;
            while (index < variableCount)
            {
                properties.push(new PropertyStruct(values.getKey(index), values.getWithIndex(index), types[index], true));
                index++;
            }
            return properties;
        }
    }
}
