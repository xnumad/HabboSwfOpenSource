package com.sulake.habbo.freeflowchat.viewer.visualization.style
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.freeflowchat.style.IChatStyleLibrary;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.text.TextFormat;
    import flash.text.StyleSheet;
    import com.sulake.habbo.freeflowchat.style.IChatStyle;

    public class ChatStyleLibrary implements IDisposable, IChatStyleLibrary 
    {
        private const _Str_22819:int = 0;

        private var _assets:IAssetLibrary;
        private var _styles:Map;

        public function ChatStyleLibrary(assets:IAssetLibrary)
        {
            var child:XML;
            var styleId:int;
            var assetId:String;
            var isSystemStyle:Boolean;
            var isHcOnly:Boolean;
            var isStaffOverrideable:Boolean;
            var allowHtml:Boolean;
            var isAmbassadorOnly:Boolean;
            var style:ChatStyle;
            this._styles = new Map();
            super();
            this._assets = assets;
            var config:XML = XML(this._assets.getAssetByName("chatstyles_xml").content);
            for each (child in config.child("style"))
            {
                styleId = child.@id[0];
                assetId = child.@assetId[0];
                isSystemStyle = (child.@systemStyle[0] == "true");
                isHcOnly = (child.@hcOnly[0] == "true");
                isStaffOverrideable = (child.@staffOverrideable[0] == "true");
                allowHtml = (child.@allowHTML[0] == "true");
                isAmbassadorOnly = (child.@ambassadorOnly[0] == "true");
                try
                {
                    style = this._Str_22503(assetId, isSystemStyle, isHcOnly, isStaffOverrideable, allowHtml, isAmbassadorOnly);
                    this._styles.add(styleId, style);
                }
                catch(e:Error)
                {
                    Logger.log(((("Error initializing chat style: " + styleId) + ", error message: ") + e.message));
                }
            }
        }

        public function dispose():void
        {
            this._styles.dispose();
            this._styles = null;
            this._assets = null;
        }

        public function get disposed():Boolean
        {
            return this._assets == null;
        }

        private function _Str_22503(k:String, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean):ChatStyle
        {
            var _local_11:BitmapData;
            var _local_7:String = String(this._assets.getAssetByName((("style_" + k) + "_regpoints")).content);
            var _local_8:BitmapData = (this._assets.getAssetByName((("style_" + k) + "_chat_bubble_base")).content as BitmapData);
            var _local_9:Rectangle = new Rectangle(this._Str_8491(_local_7, "9sliceXY").x, this._Str_8491(_local_7, "9sliceXY").y, this._Str_8491(_local_7, "9sliceWH").x, this._Str_8491(_local_7, "9sliceWH").y);
            var _local_10:Point = ((this._Str_5585(_local_7, "faceXY")) ? this._Str_8491(_local_7, "faceXY") : null);
            var _local_12:int;
            var _local_13:Boolean = ((this._Str_5585(_local_7, "anonymous")) ? this._Str_22452(_local_7, "anonymous") : false);
            if (!_local_13)
            {
                _local_11 = (this._assets.getAssetByName((("style_" + k) + "_chat_bubble_pointer")).content as BitmapData);
                _local_12 = int(this._Str_4292(_local_7, "pointerY")[0]);
            }
            var _local_14:BitmapData = ((this._assets.hasAsset((("style_" + k) + "_icon"))) ? (this._assets.getAssetByName((("style_" + k) + "_icon")).content as BitmapData) : null);
            var _local_15:Rectangle = this._Str_19117(_local_7, "textFieldMargins");
            var _local_16:BitmapData = (this._assets.getAssetByName((("style_" + k) + "_selector_preview")).content as BitmapData);
            var _local_17:BitmapData;
            if (this._assets.hasAsset((("style_" + k) + "_chat_bubble_color")))
            {
                _local_17 = (this._assets.getAssetByName((("style_" + k) + "_chat_bubble_color")).content as BitmapData);
            }
            var _local_18:Point = ((this._Str_5585(_local_7, "colorXY")) ? this._Str_8491(_local_7, "colorXY") : null);
            var _local_19:Rectangle = ((this._Str_5585(_local_7, "overlapRect")) ? this._Str_19117(_local_7, "overlapRect") : null);
            var _local_20:uint = ((this._Str_5585(_local_7, "textColorRGB")) ? uint(this._Str_4292(_local_7, "textColorRGB")[0]) : 0);
            var _local_21:String = ((this._Str_5585(_local_7, "fontFace")) ? this._Str_4292(_local_7, "fontFace")[0] : "Volter");
            var _local_22:int = ((this._Str_5585(_local_7, "fontSize")) ? int(this._Str_4292(_local_7, "fontSize")[0]) : 9);
            var _local_23:TextFormat = new TextFormat(_local_21, _local_22, _local_20);
            var _local_24:uint = ((this._Str_5585(_local_7, "linkColorRGB")) ? uint(this._Str_4292(_local_7, "linkColorRGB")[0]) : _local_20);
            var _local_25:uint = ((this._Str_5585(_local_7, "linkHoverColorRGB")) ? uint(this._Str_4292(_local_7, "linkHoverColorRGB")[0]) : _local_20);
            var _local_26:uint = ((this._Str_5585(_local_7, "linkActiveColorRGB")) ? uint(this._Str_4292(_local_7, "linkActiveColorRGB")[0]) : _local_20);
            var _local_27:StyleSheet = new StyleSheet();
            var _local_28:Object = new Object();
            _local_28.textDecoration = "underline";
            _local_28.color = this._Str_5520(_local_24);
            _local_27.setStyle("a:link", _local_28);
            var _local_29:Object = new Object();
            _local_29.color = this._Str_5520(_local_26);
            _local_27.setStyle("a:active", _local_29);
            var _local_30:Object = new Object();
            _local_30.color = this._Str_5520(_local_25);
            _local_27.setStyle("a:hover", _local_30);
            return new ChatStyle(_local_8, _local_9, _local_11, _local_12, _local_15, _local_23, _local_13, _local_10, _local_14, _local_16, _arg_2, _arg_3, _arg_4, _arg_6, _local_17, _local_18, _local_19, _arg_5, _local_27);
        }

        private function _Str_5520(k:uint):String
        {
            var _local_2:String = k.toString(16);
            while (_local_2.length < 6)
            {
                _local_2 = ("0" + _local_2);
            }
            return "#" + _local_2;
        }

        private function _Str_5585(k:String, _arg_2:String):Boolean
        {
            return !(k.indexOf(_arg_2) == -1);
        }

        private function _Str_4292(k:String, _arg_2:String):Array
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:Boolean;
            var _local_7:String;
            var _local_3:int = k.indexOf(_arg_2);
            if (_local_3 != -1)
            {
                _local_4 = k.indexOf("=", _local_3);
                _local_5 = k.indexOf("\n", _local_4);
                if (_local_5 == -1)
                {
                    _local_5 = k.length;
                }
                _local_6 = (k.charAt((_local_4 + 1)) == " ");
                _local_7 = k.substr((_local_4 + ((_local_6) ? 2 : 1)), ((_local_5 - _local_4) - ((_local_6) ? 2 : 1)));
                return _local_7.split(",");
            }
            return null;
        }

        private function _Str_8491(k:String, _arg_2:String):Point
        {
            return new Point(int(this._Str_4292(k, _arg_2)[0]), int(this._Str_4292(k, _arg_2)[1]));
        }

        private function _Str_19117(k:String, _arg_2:String):Rectangle
        {
            return new Rectangle(int(this._Str_4292(k, _arg_2)[0]), int(this._Str_4292(k, _arg_2)[1]), int(this._Str_4292(k, _arg_2)[2]), int(this._Str_4292(k, _arg_2)[3]));
        }

        private function _Str_22452(k:String, _arg_2:String):Boolean
        {
            return this._Str_4292(k, _arg_2)[0] == "true";
        }

        public function getStyleIds():Array
        {
            return this._styles.getKeys();
        }

        public function getStyle(k:int):IChatStyle
        {
            if (this._styles.hasKey(k))
            {
                return this._styles.getValue(k);
            }
            return this._styles.getValue(this._Str_22819);
        }
    }
}
