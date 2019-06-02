package com.sulake.core.window.utils
{
    public class TextStyle 
    {
        public static const NORMAL:String = "normal";
        public static const ITALIC:String = "italic";
        public static const BOLD:String = "bold";
        public static const UNDERLINE:String = "underline";
        public static const NONE:String = "none";
        public static const ADVANCED:String = "advanced";
        public static const TOP_LEFT:String = "top-left";
        public static const TOP:String = "top";
        public static const TOP_RIGHT:String = "top-right";
        public static const LEFT:String = "left";
        public static const RIGHT:String = "right";
        public static const BOTTOM_LEFT:String = "bottom-left";
        public static const BOTTOM:String = "bottom";
        public static const BOTTOM_RIGHT:String = "bottom-right";

        public var name:String;
        public var color:Object;
        public var fontFamily:String;
        public var fontSize:Object = null;
        public var fontStyle:String = null;
        public var fontWeight:String = null;
        public var kerning:Object = null;
        public var leading:Object = null;
        public var letterSpacing:Object = null;
        public var textDecoration:String = null;
        public var textIndent:Object = null;
        public var antiAliasType:String = null;
        public var sharpness:Object = null;
        public var thickness:Object = null;
        public var etchingColor:Object = null;
        public var etchingPosition:Object = null;


        public function toString():String
        {
            var k:String = "";
            k = (k + (this.name + " {\n"));
            if (this.color)
            {
                k = (k + (("\tcolor: #" + this.color.toString()) + ";\n"));
            }
            if (this.fontFamily)
            {
                k = (k + (("\tfont-family: " + this.fontFamily) + ";\n"));
            }
            if (this.fontSize)
            {
                k = (k + (("\tfont-size: " + this.fontSize) + ";\n"));
            }
            if (this.fontStyle)
            {
                k = (k + (("\tfont-style: " + this.fontStyle) + ";\n"));
            }
            if (this.fontWeight)
            {
                k = (k + (("\tfont-weight: " + this.fontWeight) + ";\n"));
            }
            if (this.kerning)
            {
                k = (k + (("\tkerning: " + this.kerning) + ";\n"));
            }
            if (this.leading)
            {
                k = (k + (("\tleading: " + this.leading) + ";\n"));
            }
            if (this.letterSpacing)
            {
                k = (k + (("\tletter-spacing: " + this.letterSpacing) + ";\n"));
            }
            if (this.textDecoration)
            {
                k = (k + (("\ttext-decoration: " + this.textDecoration) + ";\n"));
            }
            if (this.textIndent)
            {
                k = (k + (("\ttext-indent: " + this.textIndent) + ";\n"));
            }
            if (this.antiAliasType)
            {
                k = (k + (("\tanti-alias-type: " + this.antiAliasType) + ";\n"));
            }
            if (this.sharpness)
            {
                k = (k + (("\tsharpness: " + this.sharpness) + ";\n"));
            }
            if (this.thickness)
            {
                k = (k + (("\tthickness: " + this.thickness) + ";\n"));
            }
            if (this.etchingColor)
            {
                k = (k + (("\tetching-color: #" + this.etchingColor.toString()) + ";\n"));
            }
            if (this.etchingPosition)
            {
                k = (k + (("\tetching-direction: " + this.etchingPosition) + ";\n"));
            }
            k = (k + "}");
            return k;
        }

        public function equals(k:TextStyle):Boolean
        {
            return ((((((((((((((this.color == k.color) && (this.fontFamily == k.fontFamily)) && (this.fontSize == k.fontSize)) && (this.fontStyle == k.fontStyle)) && (this.fontWeight == k.fontWeight)) && (this.kerning == k.kerning)) && (this.leading == k.leading)) && (this.letterSpacing == k.letterSpacing)) && (this.textDecoration == k.textDecoration)) && (this.textIndent == k.textIndent)) && (this.antiAliasType == k.antiAliasType)) && (this.sharpness == k.sharpness)) && (this.thickness == k.thickness)) && (this.etchingColor == k.etchingColor)) && (this.etchingPosition == k.etchingPosition);
        }

        public function clone():TextStyle
        {
            var k:TextStyle = new TextStyle();
            k.name = this.name;
            k.color = this.color;
            k.fontFamily = this.fontFamily;
            k.fontSize = this.fontSize;
            k.fontStyle = this.fontStyle;
            k.fontWeight = this.fontWeight;
            k.kerning = this.kerning;
            k.leading = this.leading;
            k.letterSpacing = this.letterSpacing;
            k.textDecoration = this.textDecoration;
            k.textIndent = this.textIndent;
            k.antiAliasType = this.antiAliasType;
            k.sharpness = this.sharpness;
            k.thickness = this.thickness;
            k.etchingColor = this.etchingColor;
            k.etchingPosition = this.etchingPosition;
            return k;
        }
    }
}
