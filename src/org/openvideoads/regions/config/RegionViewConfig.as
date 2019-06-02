package org.openvideoads.regions.config
{
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.Display;

    public class RegionViewConfig extends BaseRegionConfig 
    {
        protected static var _Str_19960:Array = [{
            "id":"standard-text",
            "html":""
        }];

        protected var _Str_7287:String = "TOP";
        protected var _Str_18757:Number = 0;
        protected var _Str_12474:String = "left";
        protected var _width:*;
        protected var _height:*;
        protected var _Str_5165:Number = -1;
        protected var _Str_5160:Number = -1;
        protected var _Str_5202:* = null;
        protected var _Str_17933:Boolean = false;
        protected var _Str_16388:Boolean = true;
        protected var _Str_18291:Boolean = false;
        protected var _Str_2620:String = null;
        protected var _Str_17543:String = null;
        protected var _Str_9188:Boolean = false;
        protected var _Str_17164:Boolean = false;
        protected var _Str_4096:* = 0;
        protected var _Str_26142:String = null;
        protected var _Str_11697:Boolean = false;
        protected var _Str_16992:Boolean = false;
        protected var _Str_7726:Boolean = true;

        public function RegionViewConfig(k:Object=null)
        {
            super(k);
        }

        override public function setup(k:Object):void
        {
            var _local_2:Array;
            if (k != null)
            {
                super.setup(k);
                if (k.verticalAlign != undefined)
                {
                    if (k.verticalAlign != null)
                    {
                        if (String(k.verticalAlign).indexOf(":") > -1)
                        {
                            _local_2 = String(k.verticalAlign).split(":");
                            if (_local_2.length == 2)
                            {
                                this._Str_7287 = _local_2[0].toUpperCase();
                                this._Str_18757 = parseInt(_local_2[1]);
                            }
                            else
                            {
                                this._Str_7287 = "BOTTOM";
                            }
                        }
                        else
                        {
                            this._Str_7287 = String(k.verticalAlign).toUpperCase();
                        }
                    }
                }
                if (k.horizontalAlign != undefined)
                {
                    this._Str_12474 = k.horizontalAlign;
                }
                if (k.width != undefined)
                {
                    this._width = k.width;
                }
                if (k.height != undefined)
                {
                    this._height = k.height;
                }
                if (k.expandedWidth != undefined)
                {
                    this._Str_5165 = k.expandedWidth;
                }
                if (k.expandedHeight != undefined)
                {
                    this._Str_5160 = k.expandedHeight;
                }
                if (k.autoShow != undefined)
                {
                    this._Str_17933 = k.autoShow;
                }
                if (k.clickable != undefined)
                {
                    this._Str_16388 = k.clickable;
                }
                if (k.clickToPlay != undefined)
                {
                    this._Str_18291 = k.clickToPlay;
                }
                if (k.keepAfterClick != undefined)
                {
                    this._Str_9188 = k.keepAfterClick;
                }
                if (k.canScale != undefined)
                {
                    this._Str_17164 = k.canScale;
                }
                if (k.additionalHeight != undefined)
                {
                    this._Str_4096 = k.additionalHeight;
                }
                if (k.autoSizing != undefined)
                {
                    this._Str_11697 = k.autoSizing;
                }
                if (k.useOverrideMargin != undefined)
                {
                    this._Str_16992 = k.useOverrideMargin;
                }
                if (k.minimizedHeight != undefined)
                {
                    this._Str_5202 = k.minimizedHeight;
                }
                if (k.autoHide != undefined)
                {
                    this._Str_7726 = k.autoHide;
                }
            }
        }

        public function isAutoSizing():Boolean
        {
            return this._Str_11697;
        }

        public function set autoSizing(k:Boolean):void
        {
            this._Str_11697 = k;
        }

        public function get autoSizing():Boolean
        {
            return this._Str_11697;
        }

        public function set autoHide(k:*):void
        {
            this._Str_7726 = k;
        }

        public function get autoHide():*
        {
            return this._Str_7726;
        }

        public function set width(k:*):void
        {
            this._width = k;
        }

        public function get width():*
        {
            return this._width;
        }

        public function set height(k:*):void
        {
            this._height = k;
        }

        public function get height():*
        {
            return this._height;
        }

        public function _Str_23701():Boolean
        {
            return !(this._Str_5202 == null);
        }

        public function hasMinimizedHeightBasedOnYPosForDisplayMode(k:String):Boolean
        {
            if (this._Str_23701())
            {
                if ((this._Str_5202 is String))
                {
                    if (StringUtils._Str_2576(this._Str_5202, "CONTROLS-YPOS-WHEN-VISIBLE-ALL-MODES"))
                    {
                        return true;
                    }
                    if (StringUtils._Str_2576(k, "FULLSCREEN"))
                    {
                        return StringUtils._Str_2576(this._Str_5202, "CONTROLS-YPOS-WHEN-VISIBLE-FULLSCREEN");
                    }
                    return StringUtils._Str_2576(this._Str_5202, "CONTROLS-YPOS-WHEN-VISIBLE-NORMAL");
                }
            }
            return false;
        }

        public function set minimizedHeight(k:*):void
        {
            this._Str_5202 = k;
        }

        public function get minimizedHeight():*
        {
            return this._Str_5202;
        }

        public function calculateMinimizedHeight(k:Display):Number
        {
            if ((((StringUtils._Str_2576(this._Str_5202, "CONTROLS-YPOS-WHEN-VISIBLE-ALL-MODES")) || ((k.isNormalMode()) && (StringUtils._Str_2576(this._Str_5202, "CONTROLS-YPOS-WHEN-VISIBLE-NORMAL")))) || ((k._Str_22879()) && (StringUtils._Str_2576(this._Str_5202, "CONTROLS-YPOS-WHEN-VISIBLE-FULLSCREEN")))))
            {
                if (k._Str_21708)
                {
                    return k._Str_22782;
                }
            }
            return k.displayHeight;
        }

        public function set expandedHeight(k:Number):void
        {
            this._Str_5160 = k;
        }

        public function get expandedHeight():Number
        {
            return this._Str_5160;
        }

        public function set expandedWidth(k:Number):void
        {
            this._Str_5165 = k;
        }

        public function get expandedWidth():Number
        {
            return this._Str_5165;
        }

        public function hasExpandedSizing():Boolean
        {
            return (this._Str_5165 > -1) && (this._Str_5160 > -1);
        }

        public function set useOverrideMargin(k:Boolean):void
        {
            this._Str_16992 = k;
        }

        public function get useOverrideMargin():Boolean
        {
            return this._Str_16992;
        }

        public function _Str_23622():Boolean
        {
            if (this._Str_4096 != null)
            {
                if ((this._Str_4096 is String))
                {
                    return StringUtils._Str_2576(this._Str_4096, "CONTROLS-HEIGHT-WHEN-NORMAL");
                }
            }
            return false;
        }

        public function set additionalHeight(k:*):void
        {
            this._Str_4096 = k;
        }

        public function get additionalHeight():*
        {
            return this._Str_4096;
        }

        public function _Str_23209():Boolean
        {
            return (!(this._Str_4096 == 0)) && (!(this._Str_4096 == null));
        }

        public function _Str_23559(k:Display):Boolean
        {
            if (this._Str_4096 != null)
            {
                if ((this._Str_4096 is String))
                {
                    return (StringUtils._Str_2576(this._Str_4096, "CONTROLS-HEIGHT-WHEN-NORMAL")) && (k.isNormalMode());
                }
            }
            return false;
        }

        public function _Str_20376(k:Display):Number
        {
            if (this._Str_4096 != null)
            {
                if ((this._Str_4096 is String))
                {
                    if (((StringUtils._Str_2576(this._Str_4096, "CONTROLS-HEIGHT-WHEN-NORMAL")) && (!(k == null))))
                    {
                        return k._Str_25295;
                    }
                }
                else
                {
                    return this._Str_4096;
                }
            }
            return 0;
        }

        public function set canScale(k:Boolean):void
        {
            this._Str_17164 = k;
        }

        public function get canScale():Boolean
        {
            return this._Str_17164;
        }

        public function set autoShow(k:Boolean):void
        {
            this._Str_17933 = k;
        }

        public function get autoShow():Boolean
        {
            return this._Str_17933;
        }

        public function set keepVisibleAfterClick(k:Boolean):void
        {
            this._Str_9188 = k;
        }

        public function get keepVisibleAfterClick():Boolean
        {
            return this._Str_9188;
        }

        public function set verticalAlignPosition(k:String):void
        {
            this._Str_7287 = k;
        }

        public function get verticalAlignPosition():String
        {
            return this._Str_7287;
        }

        public function set verticalAlignOffset(k:Number):void
        {
            this._Str_18757 = k;
        }

        public function get verticalAlignOffset():Number
        {
            return this._Str_18757;
        }

        public function set horizontalAlign(k:String):void
        {
            this._Str_12474 = k;
        }

        public function get horizontalAlign():String
        {
            return this._Str_12474;
        }

        public function set clickable(k:Boolean):void
        {
            this._Str_16388 = k;
        }

        public function get clickable():Boolean
        {
            return this._Str_16388;
        }

        public function set clickToPlay(k:Boolean):void
        {
            this._Str_18291 = k;
        }

        public function get clickToPlay():Boolean
        {
            return this._Str_18291;
        }

        public function set template(k:String):void
        {
            this._Str_2620 = k;
        }

        public function get template():String
        {
            return this._Str_2620;
        }

        public function _Str_18017():Boolean
        {
            return !(this._Str_2620 == null);
        }

        public function set contentTypes(k:String):void
        {
            this._Str_17543 = k;
        }

        public function get contentTypes():String
        {
            return this._Str_17543;
        }

        public function hasContentTypes():Boolean
        {
            return !(this._Str_17543 == null);
        }
    }
}
