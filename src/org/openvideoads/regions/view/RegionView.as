package org.openvideoads.regions.view
{
    import flash.display.Sprite;
    import org.openvideoads.regions.RegionController;
    import org.openvideoads.regions.config.RegionViewConfig;
    import org.openvideoads.util.Display;
    import flash.text.TextField;
    import org.openvideoads.regions.view.button._Str_4474;
    import flash.display.Loader;
    import flash.display.Shape;
    import flash.display.Bitmap;
    import org.openvideoads.regions.view.button._Str_12411;
    import org.openvideoads.regions.view.button._Str_11624;
    import org.openvideoads.regions.view.button._Str_9873;
    import org.openvideoads.util.NumberUtils;
    import org.openvideoads.util.StyleUtils;
    import flash.events.MouseEvent;
    import org.openvideoads.base.Debuggable;
    import flash.system.Security;
    import flash.events.IOErrorEvent;
    import flash.events.Event;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLRequest;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.system.SecurityDomain;
    import org.openvideoads.util.GraphicsUtils;
    import flash.display.BlendMode;
    import flash.text.TextFieldAutoSize;
    import flash.text.AntiAliasType;
    import flash.display.*;

    public class RegionView extends Sprite 
    {
        protected var _Str_2278:RegionController;
        protected var _Str_2297:RegionViewConfig;
        protected var _Str_2758:Display;
        protected var _Str_5857:_Str_5987 = null;
        protected var _text:TextField;
        protected var _Str_9713:Sprite;
        protected var _Str_2728:_Str_4474 = null;
        protected var _Str_7726:Boolean = true;
        protected var _Str_2450:Loader = null;
        protected var _Str_2341:Sprite;
        protected var _width:Number = 0;
        protected var _height:Number = 0;
        protected var _Str_11697:Boolean = false;
        protected var _Str_3322:_Str_4027 = null;
        protected var _Str_4922:Shape = null;
        protected var _Str_3400:Bitmap = null;
        protected var _Str_11897:Boolean = true;
        protected var _Str_10200:Boolean = false;
        protected var _Str_2623:Boolean = false;

        public function RegionView(k:RegionController, _arg_2:RegionViewConfig, _arg_3:Display)
        {
            visible = false;
            buttonMode = true;
            mouseChildren = true;
            this._Str_2278 = k;
            this._Str_2297 = _arg_2;
            this._Str_2758 = _arg_3;
            this._Str_7726 = _arg_2.autoHide;
            if (_arg_2.stylesheet != null)
            {
                this._Str_5857 = new _Str_5987(_arg_2.stylesheet, this._Str_25781);
            }
            if (_arg_2.style != null)
            {
                if (this._Str_5857 == null)
                {
                    this._Str_5857 = new _Str_5987();
                }
                this._Str_5857.parseCSS(_arg_2.style);
            }
            if (this._Str_2297._Str_16602())
            {
                this._Str_24053();
            }
            this._Str_19314();
            if (this._Str_2297.html)
            {
                this.html = this._Str_2297.html;
            }
            this.resize();
            this._Str_6950();
        }

        public function isAutoSizing():Boolean
        {
            return this.autoSizing;
        }

        public function set autoSizing(k:Boolean):void
        {
            if (this._Str_2297 == null)
            {
                this._Str_2297 = new RegionViewConfig();
            }
            this._Str_2297.autoSizing = k;
        }

        public function get autoSizing():Boolean
        {
            if (this._Str_2297 != null)
            {
                return this._Str_2297.autoSizing;
            }
            return false;
        }

        public function set scalable(k:Boolean):void
        {
            this._Str_11897 = k;
        }

        public function get scalable():Boolean
        {
            return this._Str_11897;
        }

        protected function _Str_24053():void
        {
            switch (this._Str_2297.closeButton.type)
            {
                case "STANDARD":
                    this._Str_2728 = new _Str_12411(null, this);
                    break;
                case "CROSSHAIR":
                    this._Str_2728 = new _Str_11624(null, this, this._Str_2297.closeButton);
                    break;
                case "CUSTOM":
                    this._Str_2728 = new _Str_9873(null, this, this._Str_2297.closeButton);
                    break;
                case "SKINNED":
                    break;
            }
            addChild(this._Str_2728);
        }

        override public function get width():Number
        {
            if (scaleX > 1)
            {
                return this._width * scaleX;
            }
            return (this._width) || (super.width);
        }

        override public function set width(k:Number):void
        {
            this.setSize(k, this._height);
        }

        public function set _Str_26004(k:Number):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.width = k;
            }
            this.setSize(k, this._height, false);
        }

        override public function get height():Number
        {
            if (scaleY > 1)
            {
                return this._height * scaleY;
            }
            return (this._height) || (super.height);
        }

        override public function set height(k:Number):void
        {
            this.setSize(this._width, k);
        }

        public function set _Str_26129(k:Number):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.height = k;
            }
            this.setSize(this._width, k, false);
        }

        public function setSize(k:Number, _arg_2:Number, _arg_3:Boolean=true):void
        {
            this._width = k;
            this._height = _arg_2;
            this.onResize();
            if (_arg_3)
            {
                this._Str_6950();
            }
        }

        public function set borderRadius(k:int):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.borderRadius = k;
            }
        }

        public function get borderRadius():int
        {
            return (this._Str_2297 != null) ? this._Str_2297.borderRadius : -1;
        }

        public function _Str_18926():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_18926() : false;
        }

        public function _Str_26285():int
        {
            if (this._Str_18926() == false)
            {
                return 5;
            }
            return NumberUtils._Str_5288(this.borderRadius);
        }

        public function set borderWidth(k:int):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.borderWidth = k;
            }
        }

        public function get borderWidth():int
        {
            return (this._Str_2297 != null) ? this._Str_2297.borderWidth : -1;
        }

        public function _Str_15962():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_15962() : false;
        }

        public function set borderColor(k:String):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.borderColor = k;
            }
        }

        public function get borderColor():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.borderColor : null;
        }

        public function _Str_16762():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_16762() : false;
        }

        public function set border(k:String):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.border = k;
            }
        }

        public function get border():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.border : null;
        }

        public function _Str_14610():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_14610() : false;
        }

        public function _Str_26318():Number
        {
            if (this._Str_15962())
            {
                return NumberUtils._Str_5288(this.borderWidth);
            }
            if (this._Str_14610() == false)
            {
                return 0;
            }
            return NumberUtils._Str_5288(StyleUtils._Str_11604(this.border)[0]);
        }

        public function _Str_23277():uint
        {
            if (this._Str_16762())
            {
                return StyleUtils._Str_12804(this.borderColor);
            }
            if (this._Str_14610())
            {
                return StyleUtils._Str_12804(StyleUtils._Str_11604(this.border)[2]);
            }
            return 0xFFFFFF;
        }

        public function parseCSS(k:String):void
        {
            if (this._Str_5857 == null)
            {
                this._Str_5857 = new _Str_5987();
            }
            this._Str_5857.parseCSS(k);
        }

        public function set background(k:String):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.background = k;
            }
        }

        public function get background():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.background : null;
        }

        public function _Str_18749():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_18749() : false;
        }

        public function set backgroundGradient(k:*):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.backgroundGradient = k;
            }
        }

        public function get backgroundGradient():*
        {
            return (this._Str_2297 != null) ? this._Str_2297.backgroundGradient : null;
        }

        public function _Str_16430():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_16430() : false;
        }

        public function _Str_26288():Array
        {
            if (this._Str_16430())
            {
                if ((this.backgroundGradient is String))
                {
                    switch (this.backgroundGradient)
                    {
                        case "none":
                            return null;
                        case "high":
                            return [1, 0.5, 0.1, 0.3];
                        case "medium":
                            return [0.6, 0.21, 0.21];
                        case "low":
                            return [0.4, 0.15, 0.15];
                    }
                    return [0.4, 0.15, 0.15];
                }
                return this.backgroundGradient;
            }
            return null;
        }

        public function _Str_11493():void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297._Str_11493();
                this._Str_6950();
            }
        }

        public function _Str_12711():void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297._Str_12711();
                this._Str_6950();
            }
        }

        public function set _Str_23263(k:Boolean):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.backgroundColor = ((k) ? "transparent" : null);
            }
        }

        public function _Str_24625():Boolean
        {
            if (this._Str_15500() == false)
            {
                return false;
            }
            return this.backgroundColor.toUpperCase() == "TRANSPARENT";
        }

        public function set backgroundColor(k:String):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.backgroundColor = k;
            }
        }

        public function get backgroundColor():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.backgroundColor : null;
        }

        public function _Str_15500():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_15500() : false;
        }

        public function _Str_23813():uint
        {
            var k:Array;
            if (this._Str_15500())
            {
                return StyleUtils._Str_12804(this.backgroundColor);
            }
            if (this._Str_18749())
            {
                k = StyleUtils._Str_11604(this.backgroundColor);
                if (String(k[0]).indexOf("#") == 0)
                {
                    return StyleUtils._Str_12804(k[0]);
                }
            }
            return 0x333333;
        }

        public function set opacity(k:Number):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.opacity = k;
            }
        }

        public function get opacity():Number
        {
            return (this._Str_2297 != null) ? this._Str_2297.opacity : 1;
        }

        public function _Str_16995():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_16995() : false;
        }

        public function _Str_19536():void
        {
            if (this._Str_2728 != null)
            {
                this._Str_2728.visible = false;
            }
        }

        public function _Str_16602():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_16602() : false;
        }

        public function set padding(k:String):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.padding = k;
            }
        }

        public function get padding():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.padding : null;
        }

        public function get template():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.template : null;
        }

        public function _Str_18017():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297._Str_18017() : false;
        }

        public function get contentTypes():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.contentTypes : null;
        }

        public function hasContentTypes():Boolean
        {
            return (this._Str_2297 != null) ? this._Str_2297.hasContentTypes() : false;
        }

        protected function _Str_25781():void
        {
        }

        public function get id():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.id : "none";
        }

        private function _Str_19314():void
        {
            if (this._Str_2297.clickable)
            {
                addEventListener(MouseEvent.ROLL_OVER, this.onMouseOver);
                addEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
                addEventListener(MouseEvent.CLICK, this.onClick);
            }
        }

        private function removeListeners():void
        {
            if (this._Str_2297.clickable)
            {
                removeEventListener(MouseEvent.ROLL_OVER, this.onMouseOver);
                removeEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
                removeEventListener(MouseEvent.CLICK, this.onClick);
            }
        }

        public function _Str_20907():Boolean
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:int;
            var k:Number = this.width;
            if (((this.expanded) && (this._Str_2297.hasExpandedSizing())))
            {
                this.width = this._Str_2297.expandedWidth;
                return true;
            }
            _local_2 = this._Str_2297.width;
            if (typeof(_local_2) == "string")
            {
                if (_local_2.indexOf("pct") != -1)
                {
                    _local_3 = this._Str_2758.displayWidth;
                    _local_4 = parseInt(_local_2.substring(0, _local_2.indexOf("pct")));
                    this.width = ((_local_3 / 100) * _local_4);
                }
                else
                {
                    this.width = parseInt(_local_2);
                }
            }
            else
            {
                if ((_local_2 is Number))
                {
                    this.width = _local_2;
                }
            }
            return !(this.width == k);
        }

        public function setHeight():Boolean
        {
            var _local_2:*;
            var _local_3:int;
            var _local_4:int;
            var _local_5:Number;
            var k:Number = this.height;
            if (!this.expanded)
            {
                _local_2 = this._Str_2297.height;
                if (typeof(_local_2) == "string")
                {
                    if (_local_2.indexOf("pct") != -1)
                    {
                        _local_3 = 0;
                        if (((this._Str_2297._Str_23209()) && (this.minimized == false)))
                        {
                            _local_5 = 0;
                            if (this._Str_2297._Str_23622())
                            {
                                if (this._Str_2297._Str_23559(this._Str_2758))
                                {
                                    _local_5 = this._Str_2297._Str_20376(this._Str_2758);
                                }
                            }
                            else
                            {
                                _local_5 = this._Str_2297._Str_20376(this._Str_2758);
                            }
                            _local_3 = (this._Str_2758.getMarginAdjustedHeight(this._Str_2297.useOverrideMargin) + _local_5);
                        }
                        else
                        {
                            _local_3 = this._Str_2758.getMarginAdjustedHeight(this._Str_2297.useOverrideMargin);
                        }
                        _local_4 = parseInt(_local_2.substring(0, _local_2.indexOf("pct")));
                        this.height = ((_local_3 / 100) * _local_4);
                    }
                    else
                    {
                        this.height = parseInt(_local_2);
                    }
                }
                else
                {
                    if ((_local_2 is Number))
                    {
                        this.height = _local_2;
                    }
                }
            }
            return !(this.height == k);
        }

        public function setVerticalAlignment():Boolean
        {
            var k:Number = y;
            var _local_2:int = (this._Str_2758.displayHeight * scaleY);
            if ((this._Str_2297.verticalAlignPosition is String))
            {
                if (this._Str_2297.verticalAlignPosition == "TOP")
                {
                    y = (0 + this._Str_2297.verticalAlignOffset);
                }
                else
                {
                    if (this._Str_2297.verticalAlignPosition == "BOTTOM")
                    {
                        y = ((_local_2 - this.height) + this._Str_2297.verticalAlignOffset);
                    }
                    else
                    {
                        if (this._Str_2297.verticalAlignPosition == "CENTER")
                        {
                            y = (((_local_2 - this.height) / 2) + this._Str_2297.verticalAlignOffset);
                        }
                        else
                        {
                            y = new Number((this._Str_2297.verticalAlignPosition + this._Str_2297.verticalAlignOffset));
                        }
                    }
                }
            }
            else
            {
                y = (this._Str_2297.verticalAlignPosition as Number);
                y = (y + this._Str_2297.verticalAlignOffset);
            }
            return !(y == k);
        }

        public function _Str_19673():Boolean
        {
            var k:Number = x;
            var _local_2:* = this._Str_2297.horizontalAlign;
            var _local_3:int = (this._Str_2758.displayWidth * scaleX);
            if (typeof(_local_2) == "string")
            {
                _local_2 = _local_2.toUpperCase();
                if (_local_2 == "LEFT")
                {
                    x = 0;
                }
                else
                {
                    if (_local_2 == "RIGHT")
                    {
                        x = (_local_3 - this.width);
                    }
                    else
                    {
                        if (_local_2 == "CENTER")
                        {
                            x = ((_local_3 - this.width) / 2);
                        }
                        else
                        {
                            x = new Number(_local_2);
                        }
                    }
                }
            }
            else
            {
                if (typeof(_local_2) == "number")
                {
                    x = _local_2;
                }
            }
            return !(x == k);
        }

        public function set minimized(k:Boolean):void
        {
            this._Str_10200 = k;
        }

        public function get minimized():Boolean
        {
            return this._Str_10200;
        }

        public function minimize():void
        {
            this._Str_10200 = true;
            this._Str_11493();
            this.resize();
        }

        public function restore():void
        {
            if (this._Str_10200)
            {
                this._Str_10200 = false;
                this._Str_12711();
                this.resize();
            }
        }

        public function set expanded(k:Boolean):void
        {
            this._Str_2623 = k;
        }

        public function get expanded():Boolean
        {
            return this._Str_2623;
        }

        public function expand():void
        {
            if (this.expanded == false)
            {
                this.expanded = true;
                this.resize(this._Str_2758);
            }
        }

        public function _Str_23314():void
        {
            if (this.expanded)
            {
                this.expanded = false;
                this._Str_11493();
                this.resize(this._Str_2758);
            }
        }

        public function resize(k:Display=null):void
        {
            var _local_2:Boolean;
            var _local_3:Boolean;
            if (k != null)
            {
                this._Str_2758 = k;
                scaleX = ((this._Str_2297.canScale) ? k.scaleX : 1);
                scaleY = ((this._Str_2297.canScale) ? k.scaleY : 1);
            }
            if (this._Str_2758 != null)
            {
                _local_2 = this._Str_20907();
                _local_3 = this.setHeight();
                this.setVerticalAlignment();
                this._Str_19673();
                if (((this._Str_22704()) && ((_local_2) || (_local_3))))
                {
                    this._Str_17768();
                }
            }
        }

        public function set autoHide(k:Boolean):void
        {
            this._Str_7726 = k;
        }

        public function get autoHide():Boolean
        {
            return this._Str_7726;
        }

        public function set html(k:String):void
        {
            if (this._Str_2297 != null)
            {
                this._Str_2297.html = ((k == null) ? "" : k);
                this._Str_1132();
                this._Str_8978();
            }
        }

        public function get html():String
        {
            return (this._Str_2297 != null) ? this._Str_2297.html : null;
        }

        public function resizeDimensions(k:Number, _arg_2:Number):void
        {
            this._Str_2297.width = k;
            this._Str_2297.height = _arg_2;
            this._Str_20907();
            this.setHeight();
            this.setVerticalAlignment();
            this._Str_19673();
        }

        protected function _Str_22704():Boolean
        {
            if (((!(this._Str_3322 == null)) && (!(this._Str_2450 == null))))
            {
                return this._Str_3322.scale;
            }
            return false;
        }

        protected function _Str_19104(k:Number, _arg_2:Number):void
        {
            var _local_3:Number;
            if (this._Str_3322.maintainAspectRatio)
            {
                _local_3 = 1;
                if (((k > this._width) && (Math.abs((k - this._width)) > Math.abs((_arg_2 - this._height)))))
                {
                    _local_3 = (k / this._width);
                }
                else
                {
                    _local_3 = (_arg_2 / this._height);
                }
                this._Str_2450.width = Math.floor((k / _local_3));
                this._Str_2450.height = Math.floor((_arg_2 / _local_3));
            }
            else
            {
                if (k > this._width)
                {
                    this._Str_2450.width = this._width;
                }
                if (_arg_2 > this._height)
                {
                    this._Str_2450.height = this._height;
                }
            }
        }

        protected function _Str_17768():void
        {
            if (this.scalable)
            {
                if (((!(this._Str_3322 == null)) && (!(this._Str_2450 == null))))
                {
                    this._Str_16801(((((((("enforceRecommendedSizing = " + this._Str_3322.enforceRecommendedSizing) + ", scale = ") + this._Str_3322.scale) + " recommendedWidth = ") + this._Str_3322.recommendedWidth) + " recommendedHeight = ") + this._Str_3322.recommendedHeight), Debuggable._Str_12852);
                    if (this._Str_3322.loaded)
                    {
                        if (this._Str_3322.scale)
                        {
                            if (this._Str_3322.enforceRecommendedSizing)
                            {
                                if (((this._Str_3322.recommendedHeight > this._height) || (this._Str_3322.recommendedWidth > this._width)))
                                {
                                    this._Str_19104(this._Str_3322.recommendedWidth, this._Str_3322.recommendedHeight);
                                }
                            }
                            else
                            {
                                if (((this._Str_2450.height > this._height) || (this._Str_2450.width > this._width)))
                                {
                                    this._Str_19104(this._Str_2450.width, this._Str_2450.height);
                                }
                            }
                            if (this.isAutoSizing())
                            {
                                this.resizeDimensions(this._Str_2450.width, this._Str_2450.height);
                            }
                            else
                            {
                                if (((this._Str_2450.width > 0) && (this._Str_2450.width < this._width)))
                                {
                                    this._Str_2450.x = (0 + Math.floor(((this._width - this._Str_2450.width) / 2)));
                                }
                                if (((this._Str_2450.height > 0) && (this._Str_2450.height < this._height)))
                                {
                                    this._Str_2450.y = (0 + Math.floor(((this._height - this._Str_2450.height) / 2)));
                                }
                            }
                        }
                    }
                }
            }
        }

        protected function _Str_22127(url:String, expectedWidth:Number, expectedHeight:Number, recommendedWidth:Number, recommendedHeight:Number, scaleToDeclaredSize:Boolean, maintainAspectRatio:Boolean, allowDomains:String):void
        {
            if (url != null)
            {
                this._Str_13579();
                Security.allowDomain(allowDomains);
                Security.allowInsecureDomain(allowDomains);
                this._Str_2450 = new Loader();
                this._Str_2450.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, function (k:Event):void
                {
                });
                this._Str_2450.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function (k:Event):void
                {
                });
                this._Str_2450.contentLoaderInfo.addEventListener(Event.COMPLETE, function (k:Event):void
                {
                    var _local_2:Number;
                    var _local_3:Number;
                    _Str_3400 = Bitmap(_Str_2450.content);
                    _Str_3400.x = 0;
                    _Str_3400.y = 0;
                    if (scalable)
                    {
                        _local_2 = (recommendedWidth / _Str_3400.width);
                        _local_3 = (recommendedHeight / _Str_3400.height);
                        if (scaleToDeclaredSize)
                        {
                            _Str_3400.scaleX = _local_2;
                            _Str_3400.scaleY = _local_3;
                        }
                        else
                        {
                            if (_local_2 < _local_3)
                            {
                                if (maintainAspectRatio)
                                {
                                    _Str_3400.scaleX = (_Str_3400.scaleY = _local_2);
                                }
                                else
                                {
                                    _Str_3400.scaleX = _local_2;
                                }
                            }
                            else
                            {
                                if (maintainAspectRatio)
                                {
                                    _Str_3400.scaleX = (_Str_3400.scaleY = _local_3);
                                }
                                else
                                {
                                    _Str_3400.scaleX = _local_3;
                                }
                            }
                        }
                        if (isAutoSizing())
                        {
                            resizeDimensions(_Str_3400.width, _Str_3400.height);
                        }
                    }
                    addChild(_Str_3400);
                    _Str_8978();
                    _Str_3400.visible = true;
                    _Str_2450 = null;
                });
                this._Str_2450.load(new URLRequest(url), new LoaderContext(true, ApplicationDomain.currentDomain, SecurityDomain.currentDomain));
            }
        }

        public function _Str_15552(media:_Str_4027, allowDomains:String, blockMouseActions:Boolean=false):void
        {
            this._Str_13579();
            Security.allowDomain(allowDomains);
            Security.allowInsecureDomain(allowDomains);
            this._Str_2450 = new Loader();
            this._Str_3322 = media;
            this._Str_3322._Str_3654();
            var urlReq:URLRequest = new URLRequest(media._Str_12737);
            this._Str_2450.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, function (k:Event):void
            {
                if (_Str_3322 != null)
                {
                    _Str_3322.signalLoadError("IO Error loading external SWF");
                }
            });
            this._Str_2450.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function (k:Event):void
            {
                if (_Str_3322 != null)
                {
                    _Str_3322.signalLoadError("Security Error loading external SWF");
                }
            });
            this._Str_2450.contentLoaderInfo.addEventListener(Event.COMPLETE, function (k:Event):void
            {
                _Str_3322._Str_3144();
                _Str_17768();
                _Str_4922 = new Shape();
                _Str_4922.graphics.beginFill(0);
                _Str_4922.graphics.drawRect(0, 0, width, height);
                _Str_4922.graphics.endFill();
                addChild(_Str_4922);
                _Str_2450.visible = true;
                _Str_2450.mask = _Str_4922;
                onFlashContentLoaded();
            });
            this._Str_2450.mouseChildren = (!(blockMouseActions));
            this._Str_2450.mouseEnabled = (!(blockMouseActions));
            this._Str_2450.visible = false;
            addChild(this._Str_2450);
            this._Str_2450.load(urlReq, new LoaderContext(true, new ApplicationDomain(), SecurityDomain.currentDomain));
            this._Str_8978();
        }

        protected function onFlashContentLoaded():void
        {
        }

        public function _Str_13579():void
        {
            if (this._Str_2450 != null)
            {
                try
                {
                    this.removeChild(this._Str_2450);
                    this._Str_2450.unload();
                }
                catch(ae:ArgumentError)
                {
                }
                this._Str_2450 = null;
            }
            else
            {
                if (this._Str_3400 != null)
                {
                    this.removeChild(this._Str_3400);
                    this._Str_3400 = null;
                }
            }
            this._Str_4922 = null;
        }

        private function _Str_1132():void
        {
            if (this._text)
            {
                removeChild(this._text);
            }
            this._text = GraphicsUtils._Str_20156(false, null, 12, false);
            this._text.blendMode = BlendMode.NORMAL;
            this._text.autoSize = TextFieldAutoSize.CENTER;
            this._text.wordWrap = true;
            this._text.multiline = true;
            this._text.antiAliasType = AntiAliasType.ADVANCED;
            this._text.condenseWhite = true;
            this._text.mouseEnabled = false;
            if (this._Str_5857 != null)
            {
                this._text.styleSheet = this._Str_5857.stylesheet;
            }
            if (this.html != null)
            {
                this._text.htmlText = this.html;
            }
            addChild(this._text);
            this._Str_9713 = this._Str_24058();
            addChild(this._Str_9713);
            this._text.mask = this._Str_9713;
            this._Str_21483();
        }

        private function _Str_21483():void
        {
            var k:Array;
            var _local_2:Array;
            var _local_3:int;
            if (this._text)
            {
                k = new Array();
                if (this.padding.indexOf(" ") > 0)
                {
                    _local_2 = this.padding.split(" ");
                    this._text.y = NumberUtils._Str_5288(_local_2[0]);
                    this._text.x = NumberUtils._Str_5288(_local_2[3]);
                    this._text.height = Math.round(((this._height - NumberUtils._Str_5288(_local_2[0])) - NumberUtils._Str_5288(_local_2[2])));
                    this._text.width = Math.round(((this._width - NumberUtils._Str_5288(_local_2[1])) - NumberUtils._Str_5288(_local_2[3])));
                }
                else
                {
                    _local_3 = NumberUtils._Str_5288(this.padding);
                    this._text.y = Math.round(_local_3[0]);
                    this._text.x = Math.round(_local_3[3]);
                    this._text.height = Math.round(((this._height - _local_3[0]) - _local_3[2]));
                    this._text.width = Math.round(((this._width - _local_3[1]) - _local_3[3]));
                }
            }
        }

        protected function onResize():void
        {
            this._Str_8978();
            if (this._Str_9713)
            {
                this._Str_9713.width = this._width;
                this._Str_9713.height = this._height;
            }
            if (this._Str_4922 != null)
            {
                this._Str_4922.width = this._width;
                this._Str_4922.height = this._height;
            }
            this.x = 0;
            this.y = 0;
        }

        protected function _Str_24846():void
        {
            this._Str_21483();
            this._Str_8978();
        }

        private function _Str_8978():void
        {
            if (this._Str_2728)
            {
                this._Str_2728.calculateLayoutPosition(this.width, this.borderRadius);
                if (numChildren > 0)
                {
                    setChildIndex(this._Str_2728, (numChildren - 1));
                }
            }
        }

        public function _Str_14359():void
        {
            this.hide();
            this._Str_2278.onRegionCloseClicked(this);
        }

        public function show():void
        {
            this._Str_19314();
            this.visible = true;
        }

        public function hide():void
        {
            this.removeListeners();
            this.visible = false;
        }

        protected function onMouseOver(k:MouseEvent):void
        {
        }

        protected function onMouseOut(k:MouseEvent):void
        {
        }

        protected function onClick(k:MouseEvent):void
        {
            if (this.autoHide)
            {
                this.hide();
            }
            this._Str_2278.onRegionClicked(this, k);
        }

        private function _Str_6950():void
        {
            this._Str_23746();
            this._Str_25466();
            this._Str_24846();
        }

        private function _Str_23746():void
        {
            graphics.clear();
            if (this._Str_16995())
            {
                alpha = this.opacity;
            }
            if (this._Str_24625() == false)
            {
                graphics.beginFill(this._Str_23813());
            }
            else
            {
                graphics.beginFill(0, 0);
            }
            GraphicsUtils.drawRoundRectangle(graphics, 0, 0, this._width, this._height, this.borderRadius);
            graphics.endFill();
            if (this.backgroundGradient)
            {
                GraphicsUtils._Str_23331(this, 0, this.backgroundGradient, this.borderRadius);
            }
            else
            {
                GraphicsUtils._Str_17793(this);
            }
        }

        protected function _Str_24058():Sprite
        {
            var k:Sprite = new Sprite();
            k.graphics.beginFill(0);
            GraphicsUtils.drawRoundRectangle(k.graphics, 0, 0, this.width, this.height, this.borderRadius);
            return k;
        }

        private function _Str_25466():void
        {
            if (((this._Str_2341) && (this._Str_2341.parent == this)))
            {
                removeChild(this._Str_2341);
            }
            if (this.borderWidth <= 0)
            {
                return;
            }
            this._Str_2341 = new Sprite();
            addChild(this._Str_2341);
            this._Str_2341.graphics.lineStyle(this.borderWidth, this._Str_23277());
            GraphicsUtils.drawRoundRectangle(this._Str_2341.graphics, 0, 0, this.width, this.height, this.borderRadius);
        }

        protected function _Str_16801(k:String, _arg_2:int=1):void
        {
        }

        protected function _Str_19580(k:Object, _arg_2:int=1):void
        {
        }
    }
}
