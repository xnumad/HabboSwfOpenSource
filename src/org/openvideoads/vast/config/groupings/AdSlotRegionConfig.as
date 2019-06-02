package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.ArrayUtils;
    import org.openvideoads.vast.schedule.ads.templates._Str_4426;
    import org.openvideoads.vast.schedule.ads.templates._Str_3048;
    import org.openvideoads.vast.schedule.ads.templates.*;

    public class AdSlotRegionConfig extends Debuggable 
    {
        protected var _Str_4373:Boolean = false;
        protected var _Str_21590:Boolean = false;
        protected var _width:int = -1;
        protected var _height:int = -1;
        protected var _Str_21979:Array = null;
        protected var _Str_2442:Object = null;
        protected var _Str_4160:Object;
        protected var _Str_9188:Boolean = false;
        protected var _Str_20518:Boolean = false;
        protected var _Str_9771:Boolean = true;
        protected var _Str_4491:String = "flash";
        protected var _Str_8367:Boolean = true;
        protected var _Str_13300:* = null;
        protected var _Str_9491:CloseButtonConfig = null;

        public function AdSlotRegionConfig(k:String="flash", _arg_2:Object=null, _arg_3:Object=null)
        {
            this._Str_4160 = new Object();
            super();
            this._Str_4491 = k;
            if (_arg_2 != null)
            {
                this.initialise(_arg_2, _arg_3);
            }
        }

        public function initialise(k:Object, _arg_2:Object=null):void
        {
            if (k != null)
            {
                if (k.hasOwnProperty("enable"))
                {
                    this.enable = k.enable;
                }
                if (k.hasOwnProperty("prefer"))
                {
                    this.prefer = k.prefer;
                }
                if (k.hasOwnProperty("width"))
                {
                    this.width = k.width;
                }
                if (k.hasOwnProperty("height"))
                {
                    this.height = k.height;
                }
                if (k.hasOwnProperty("acceptedAdTypes"))
                {
                    this.acceptedAdTypes = k.acceptedAdTypes;
                }
                if (k.hasOwnProperty("keepVisibleAfterClick"))
                {
                    this.keepVisibleAfterClick = k.keepVisibleAfterClick;
                }
                if (k.hasOwnProperty("enableScaling"))
                {
                    this.enableScaling = k.enableScaling;
                }
                if (k.hasOwnProperty("enforceRecommendedSizing"))
                {
                    this.enforceRecommendedSizing = k.enforceRecommendedSizing;
                }
                if (k.hasOwnProperty("region"))
                {
                    this.region = k.region;
                }
                if (k.hasOwnProperty("templates"))
                {
                    this.templates = k.templates;
                }
                if (k.hasOwnProperty("overlay"))
                {
                    this.overlay = k.overlay;
                }
                if (k.hasOwnProperty("alwaysMatch"))
                {
                    this.alwaysMatch = k.alwaysMatch;
                }
                if (k.hasOwnProperty("closeButton"))
                {
                    this._Str_9491 = new CloseButtonConfig(k.closeButton);
                }
                else
                {
                    this._Str_9491 = null;
                }
                if (_arg_2 != null)
                {
                    if (_arg_2.hasOwnProperty("enable"))
                    {
                        this.enable = _arg_2.enable;
                    }
                    if (_arg_2.hasOwnProperty("prefer"))
                    {
                        this.prefer = _arg_2.prefer;
                    }
                    if (_arg_2.hasOwnProperty("width"))
                    {
                        this.width = _arg_2.width;
                    }
                    if (_arg_2.hasOwnProperty("height"))
                    {
                        this.height = _arg_2.height;
                    }
                    if (_arg_2.hasOwnProperty("acceptedAdTypes"))
                    {
                        this.acceptedAdTypes = _arg_2.acceptedAdTypes;
                    }
                    if (_arg_2.hasOwnProperty("keepVisibleAfterClick"))
                    {
                        this.keepVisibleAfterClick = _arg_2.keepVisibleAfterClick;
                    }
                    if (_arg_2.hasOwnProperty("enableScaling"))
                    {
                        this.enableScaling = _arg_2.enableScaling;
                    }
                    if (_arg_2.hasOwnProperty("enforceRecommendedSizing"))
                    {
                        this.enforceRecommendedSizing = _arg_2.enforceRecommendedSizing;
                    }
                    if (_arg_2.hasOwnProperty("region"))
                    {
                        this.region = _arg_2.region;
                    }
                    if (_arg_2.hasOwnProperty("templates"))
                    {
                        this.templates = _arg_2.templates;
                    }
                    if (_arg_2.hasOwnProperty("overlay"))
                    {
                        this.overlay = _arg_2.overlay;
                    }
                    if (_arg_2.hasOwnProperty("alwaysMatch"))
                    {
                        this.alwaysMatch = _arg_2.alwaysMatch;
                    }
                    if (_arg_2.hasOwnProperty("closeButton"))
                    {
                        this._Str_9491 = new CloseButtonConfig(_arg_2.closeButton);
                    }
                }
            }
        }

        public function get displayMode():String
        {
            return this._Str_4491;
        }

        public function set enable(k:*):void
        {
            this._Str_4373 = StringUtils._Str_2810(k);
        }

        public function get enable():Boolean
        {
            return this._Str_4373;
        }

        public function _Str_26186():Boolean
        {
            if (this._Str_9491 != null)
            {
                return this._Str_9491.enabled;
            }
            return false;
        }

        public function get buttonConfig():CloseButtonConfig
        {
            return this._Str_9491;
        }

        public function set overlay(k:*):void
        {
            this._Str_8367 = StringUtils._Str_2810(k);
        }

        public function get overlay():Boolean
        {
            return this._Str_8367;
        }

        public function set prefer(k:*):void
        {
            this._Str_21590 = StringUtils._Str_2810(k);
        }

        public function get prefer():Boolean
        {
            return this._Str_21590;
        }

        public function hasSize():Boolean
        {
            return (this.hasWidthSpecified()) && (this.hasHeightSpecified());
        }

        public function hasWidthSpecified():Boolean
        {
            return this.width > -1;
        }

        public function set width(k:*):void
        {
            if ((k is String))
            {
                this._width = parseInt(k);
            }
            else
            {
                this._width = k;
            }
        }

        public function get width():int
        {
            return this._width;
        }

        public function hasHeightSpecified():Boolean
        {
            return this.height > -1;
        }

        public function set height(k:*):void
        {
            if ((k is String))
            {
                this._height = parseInt(k);
            }
            else
            {
                this._height = k;
            }
        }

        public function get height():int
        {
            return this._height;
        }

        public function set enableScaling(k:*):void
        {
            this._Str_20518 = StringUtils._Str_2810(k);
        }

        public function get enableScaling():Boolean
        {
            return this._Str_20518;
        }

        public function _Str_26192():Boolean
        {
            return !(this._Str_13300 == null);
        }

        public function set alwaysMatch(k:*):void
        {
            this._Str_13300 = StringUtils._Str_2810(k);
        }

        public function get alwaysMatch():Boolean
        {
            if (this._Str_13300 == null)
            {
                if (((this.width < 0) && (this.height < 0)))
                {
                    return true;
                }
                return false;
            }
            return this._Str_13300;
        }

        public function set enforceRecommendedSizing(k:Boolean):void
        {
            this._Str_9771 = k;
        }

        public function get enforceRecommendedSizing():Boolean
        {
            return this._Str_9771;
        }

        public function set keepVisibleAfterClick(k:Boolean):void
        {
            this._Str_9188 = k;
        }

        public function get keepVisibleAfterClick():Boolean
        {
            return this._Str_9188;
        }

        public function set acceptedAdTypes(k:*):void
        {
            if ((k is Array))
            {
                this._Str_21979 = ArrayUtils.toUpperCase(k);
            }
        }

        public function get acceptedAdTypes():Array
        {
            return this._Str_21979;
        }

        public function set region(k:Object):void
        {
            this._Str_2442 = k;
        }

        public function get region():Object
        {
            return this._Str_2442;
        }

        public function _Str_25238(k:String):String
        {
            var _local_2:String;
            if (((!(this._Str_2442 == null)) && (!(k == null))))
            {
                _local_2 = k.toLowerCase();
                if (this._Str_2442.hasOwnProperty(_local_2))
                {
                    return this._Str_2442[_local_2];
                }
            }
            return "auto:bottom";
        }

        public function set templates(k:Object):void
        {
            this._Str_4160 = k;
        }

        public function get templates():Object
        {
            return this._Str_4160;
        }

        public function _Str_23774(k:String):_Str_3048
        {
            var _local_2:String;
            if (((!(this._Str_4160 == null)) && (!(k == null))))
            {
                _local_2 = k.toLowerCase();
                if (this._Str_4160.hasOwnProperty(_local_2))
                {
                    return this._Str_4160[_local_2];
                }
            }
            return new _Str_4426();
        }
    }
}
