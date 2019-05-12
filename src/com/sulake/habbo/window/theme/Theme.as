package com.sulake.habbo.window.theme
{
    import com.sulake.core.window.theme.PropertyMap;

    public class Theme 
    {
        public static const NONE:String = "None";
        public static const ICON:String = "Icon";
        public static const LEGACY_BORDER:String = "Legacy border";
        public static const VOLTER:String = "Volter";
        public static const UBUNTU:String = "Ubuntu";
        public static const ILLUMINA_LIGHT:String = "Illumina Light";
        public static const ILLUMINA_DARK:String = "Illumina Dark";

        private var _name:String;
        private var _isReal:Boolean;
        private var _baseStyle:uint;
        private var _styleCount:uint;
        private var _propertyDefaults:PropertyMap;

        public function Theme(name:String, isReal:Boolean, baseStyle:uint, styleCount:uint, propertyDefaults:PropertyMap)
        {
            this._name = name;
            this._isReal = isReal;
            this._baseStyle = baseStyle;
            this._styleCount = styleCount;
            this._propertyDefaults = propertyDefaults;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get isReal():Boolean
        {
            return this._isReal;
        }

        public function get baseStyle():uint
        {
            return this._baseStyle;
        }

        public function get styleCount():uint
        {
            return this._styleCount;
        }

        public function get propertyDefaults():PropertyMap
        {
            return this._propertyDefaults;
        }

        public function coversStyle(style:uint):Boolean
        {
            return (style >= this._baseStyle) && (style < (this._baseStyle + this._styleCount));
        }
    }
}
