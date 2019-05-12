package com.sulake.core.utils
{
    public class ErrorReportStorage 
    {
        private static var _errorData:Map = new Map();
        private static var _debugData:Map = new Map();

        public static function getDebugData():String
        {
            var result:String = "";
            var count:int;
            while (count < _debugData.length)
            {
                if (count == 0)
                {
                    result = _debugData.getWithIndex(count);
                }
                else
                {
                    result = ((result + " ** ") + _debugData.getWithIndex(count));
                }
                count++;
            }
            if (result.length > 400)
            {
                result = result.substr((result.length - 400));
            }
            return result;
        }

        public static function addDebugData(key:String, value:String):void
        {
            _debugData.remove(key);
            _debugData.add(key, value);
        }

        public static function setParameter(key:String, value:String):void
        {
            _errorData[key] = value;
        }

        public static function getParameter(key:String):String
        {
            return _errorData[key];
        }

        public static function getParameterNames():Array
        {
            return _errorData.getKeys();
        }
    }
}
