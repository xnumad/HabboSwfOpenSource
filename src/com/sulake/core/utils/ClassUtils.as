package com.sulake.core.utils
{
    import flash.utils.describeType;
    import flash.utils.getQualifiedClassName;
    import flash.utils.*;

    public class ClassUtils 
    {
        public static function implementsInterface(testedClass:Class, interfaceClass:Class):Boolean
        {
            return describeType(testedClass).factory.implementsInterface.(@type == getQualifiedClassName(interfaceClass)).length() > 0;
        }

        public static function getSimpleQualifiedClassName(k:*):String
        {
            var name:String = getQualifiedClassName(k);
            var namespaceIndex:int = name.indexOf("::");
            if (namespaceIndex > 0)
            {
                return name.substr((namespaceIndex + 2), name.length);
            }
            return name;
        }
    }
}
