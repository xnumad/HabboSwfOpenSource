package com.sulake.core.window.dynamicstyle
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.WindowController;
    import flash.geom.ColorTransform;

    public class DynamicStyle 
    {
        public static const STYLE_LIFTED_HOVER:String = "lifted_hover";
        public static const BRIGHTNESS_AND_SHADOW_UNDER:String = "brightness_and_shadow_under";

        public var name:String;
        public var hoverStyles:Object;
        public var defaultStyles:Object;
        public var pressedSyles:Object;
        public var disabledStyles:Object;
        public var childDynamicStyles:Dictionary;

        public function DynamicStyle(name:String="")
        {
            this.hoverStyles = {};
            this.defaultStyles = {};
            this.pressedSyles = {};
            this.disabledStyles = {"colorTransform":[1, 1, 1, 0.4, 0, 0, 0, 0]};
            this.childDynamicStyles = new Dictionary();
            super();
            this.name = name;
        }

        public function getStyleByWindowState(state:uint):Object
        {
            switch (state)
            {
                case WindowState.PRESSED:
                    return this.pressedSyles;
                case WindowState.HOVERING:
                    return this.hoverStyles;
                case WindowState.DEFAULT:
                    return this.defaultStyles;
                case WindowState.DISABLED:
                    return this.disabledStyles;
            }
            return {};
        }

        private function getChildDynamicStyleByKey(key:String):DynamicStyle
        {
            if (this.childDynamicStyles[key])
            {
                return this.childDynamicStyles[key];
            }
            return new DynamicStyle();
        }

        public function getChildStyle(childController:WindowController):DynamicStyle
        {
            for each (var tag:String in childController.tags)
            {
                if (tag.charAt(0) == "#")
                {
                    return this.getChildDynamicStyleByKey(tag);
                }
            }
            return null;
        }

        public function getColorValue(value:uint):uint
        {
            if (this.getStyleByWindowState(value).colorTransform)
            {
                var transform:Array = this.getStyleByWindowState(value).colorTransform;
                var colorString:String = "";
                for (var index:int = 0; index < 3; index++)
                {
                    var channel:int = ((transform[index] * 0xFF) + transform[(index + 4)]);
                    colorString = (colorString + Number(Math.min(0xFF, channel)).toString(16));
                }
                return parseInt(colorString, 16);
            }
            return null;
        }

        public function getColorTransform(state:uint):ColorTransform
        {
            if (this.getStyleByWindowState(state).colorTransform)
            {
                var transform:Array = this.getStyleByWindowState(state).colorTransform;
                var tint:Array = this.getStyleByWindowState(state).tint;
                if (!tint)
                {
                    tint = [0xFF, 0xFF, 0xFF];
                }
                return new ColorTransform(((transform[0] * tint[0]) / 0xFF), ((transform[1] * tint[1]) / 0xFF), ((transform[2] * tint[2]) / 0xFF), transform[3], transform[4], transform[5], transform[6], transform[7]);
            }
            return new ColorTransform();
        }
    }
}
