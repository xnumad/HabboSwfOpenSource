package com.sulake.core.window.dynamicstyle
{
    import flash.utils.Dictionary;

    public class DynamicStyleManager 
    {
        private static var _styles:Dictionary;

        public static function getStyle(style:String):DynamicStyle
        {
            if (!_styles)
            {
                fillStyleTable();
            }
            if ((style in _styles))
            {
                return _styles[style];
            }
            return new DynamicStyle();
        }

        private static function fillStyleTable():void
        {
            _styles = new Dictionary();
            var dynamicStyle:DynamicStyle = new DynamicStyle(DynamicStyle.STYLE_LIFTED_HOVER);
            dynamicStyle.defaultStyles = {};
            dynamicStyle.pressedSyles = {
                "offsetX":1,
                "colorTransform":[1, 0.7, 0.7, 0.7, 0, 0, 0, 0]
            }
            dynamicStyle.hoverStyles = {
                "offsetY":-1,
                "offsetX":-1
            }
            var _local_2:DynamicStyle = new DynamicStyle();
            _local_2.defaultStyles = {
                "etchingColor":0x48000000,
                "etchingPoint":[1, 1]
            }
            _local_2.hoverStyles = {
                "etchingColor":0x80000000,
                "etchingPoint":[2, 2]
            }
            _local_2.pressedSyles = {
                "etchingColor":0x48000000,
                "etchingPoint":[-1, -1]
            }
            dynamicStyle.childDynamicStyles["#icon"] = _local_2;
            var shadowUnderStyle:DynamicStyle = new DynamicStyle(DynamicStyle.BRIGHTNESS_AND_SHADOW_UNDER);
            shadowUnderStyle.defaultStyles = {};
            var _local_4:DynamicStyle = new DynamicStyle();
            _local_4.defaultStyles = {
                "etchingColor":0x48000000,
                "etchingPoint":[0, 1]
            }
            _local_4.pressedSyles = {
                "etchingColor":0x80000000,
                "etchingPoint":[0, -1],
                "offsetY":-1,
                "colorTransform":[0.7, 0.7, 0.7, 1, 0, 0, 0, 0]
            }
            _local_4.hoverStyles = {
                "etchingColor":0x48000000,
                "etchingPoint":[0, 1],
                "colorTransform":[1, 1, 1, 1, 77, 77, 77, 0]
            }
            shadowUnderStyle.childDynamicStyles["#icon"] = _local_4;
            var _local_5:DynamicStyle = new DynamicStyle();
            _local_5.defaultStyles = {
                "etchingColor":0x48000000,
                "etchingPoint":[0, 1]
            }
            _local_5.pressedSyles = {
                "etchingColor":0x80000000,
                "etchingPoint":[0, 0],
                "colorTransform":[0.9, 0.9, 0.9, 1, 0, 0, 0, 0]
            }
            _local_5.hoverStyles = {
                "etchingColor":0x48000000,
                "etchingPoint":[0, 1],
                "colorTransform":[1, 1, 1, 1, 77, 77, 77, 0]
            }
            _local_5.disabledStyles = {"colorTransform":[0.5, 0.5, 0.5, 0.7, 0, 0, 0, 0]};
            shadowUnderStyle.childDynamicStyles["#bg"] = _local_5;
            _styles[DynamicStyle.STYLE_LIFTED_HOVER] = dynamicStyle;
            _styles[DynamicStyle.BRIGHTNESS_AND_SHADOW_UNDER] = shadowUnderStyle;
        }
    }
}
