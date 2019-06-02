package org.openvideoads.vast.model
{
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.vast.config.groupings.AdSlotRegionConfig;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.vast.events._Str_2833;
    import org.openvideoads.vast.events._Str_3019;

    public class NonLinearVideoAd extends TrackedVideoAd 
    {
        protected var _width:int = -1;
        protected var _height:int = -1;
        protected var _Str_5165:int = -1;
        protected var _Str_5160:int = -1;
        protected var _Str_3532:String;
        protected var _Str_4009:String;
        protected var _Str_4949:String;
        protected var _Str_577:NetworkResource;
        protected var _Str_3366:String;
        protected var _Str_5280:Array;
        protected var _Str_9031:AdSlotRegionConfig = null;
        protected var _Str_26030:Number = -1;
        protected var _Str_26041:Number = -1;
        protected var _Str_4218:Boolean = false;
        protected var _Str_5000:String = null;

        public function NonLinearVideoAd()
        {
            this._Str_5280 = new Array();
            super();
        }

        override public function unload():void
        {
            var k:int;
            super.unload();
            if (this._Str_20657())
            {
                k = 0;
                while (k < this._Str_5280.length)
                {
                    NetworkResource(this._Str_5280[k]).close();
                    k++;
                }
            }
        }

        public function _Str_25923(k:Array):Boolean
        {
            if (this._Str_4009 == null)
            {
                return true;
            }
            var _local_2:int;
            while (_local_2 < k.length)
            {
                if (StringUtils._Str_2576(this._Str_4009, k[_local_2]))
                {
                    return true;
                }
                _local_2++;
            }
            return false;
        }

        public function set width(k:*):void
        {
            if (typeof(k) == "string")
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

        public function _Str_17410():Boolean
        {
            return this._width > -1;
        }

        public function set height(k:*):void
        {
            if (typeof(k) == "string")
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

        public function _Str_17902():Boolean
        {
            return this._height > -1;
        }

        public function set expandedWidth(k:*):void
        {
            if (typeof(k) == "string")
            {
                this._Str_5165 = parseInt(k);
            }
            else
            {
                this._Str_5165 = k;
            }
        }

        public function get expandedWidth():int
        {
            return this._Str_5165;
        }

        public function _Str_23123():Boolean
        {
            return this._Str_5165 > -1;
        }

        public function set expandedHeight(k:*):void
        {
            if (typeof(k) == "string")
            {
                this._Str_5160 = parseInt(k);
            }
            else
            {
                this._Str_5160 = k;
            }
        }

        public function get expandedHeight():int
        {
            return this._Str_5160;
        }

        public function _Str_22467():Boolean
        {
            return this._Str_5160 > -1;
        }

        public function _Str_16096():Boolean
        {
            return (this._Str_23123()) && (this._Str_22467());
        }

        public function _Str_3654():void
        {
            this._Str_4218 = false;
        }

        public function _Str_3144():void
        {
            this._Str_4218 = true;
        }

        public function get loaded():Boolean
        {
            return this._Str_4218;
        }

        public function set resourceType(k:String):void
        {
            this._Str_3532 = ((k != null) ? k.toUpperCase() : k);
        }

        public function get resourceType():String
        {
            return this._Str_3532;
        }

        public function set creativeType(k:String):void
        {
            this._Str_4009 = ((k != null) ? k.toUpperCase() : k);
        }

        public function get creativeType():String
        {
            var k:int;
            if (this._Str_4009 != null)
            {
                k = this._Str_4009.indexOf("/");
                if (((k > -1) && ((k + 1) < this._Str_4009.length)))
                {
                    return this._Str_4009.substr((k + 1));
                }
            }
            return this._Str_4009;
        }

        public function get _Str_26441():String
        {
            return this._Str_4009;
        }

        public function _Str_24710():Boolean
        {
            return !(this._Str_4009 == null);
        }

        public function set apiFramework(k:String):void
        {
            this._Str_4949 = k;
        }

        public function get apiFramework():String
        {
            return this._Str_4949;
        }

        public function _Str_21162():Boolean
        {
            return !(StringUtils.isEmpty(this._Str_4949));
        }

        public function isInteractive():Boolean
        {
            return false;
        }

        public function set url(k:NetworkResource):void
        {
            this._Str_577 = k;
        }

        public function get url():NetworkResource
        {
            return this._Str_577;
        }

        public function set adParameters(k:String):void
        {
            this._Str_5000 = k;
        }

        public function get adParameters():String
        {
            return this._Str_5000;
        }

        public function _Str_16651():Boolean
        {
            return !(this._Str_5000 == null);
        }

        public function _Str_4309():Boolean
        {
            if (this._Str_577 != null)
            {
                return this._Str_577._Str_4309();
            }
            return false;
        }

        public function set codeBlock(k:String):void
        {
            this._Str_3366 = k;
        }

        public function get codeBlock():String
        {
            return this._Str_3366;
        }

        public function _Str_3937():Boolean
        {
            if (this._Str_3366 != null)
            {
                return StringUtils.trim(this._Str_3366).length > 0;
            }
            return false;
        }

        public function isEmpty():Boolean
        {
            return (!(this._Str_4309())) && (!(this._Str_3937()));
        }

        public function getContentFormat():String
        {
            if (this._Str_4309())
            {
                return "URL";
            }
            return "CODE";
        }

        public function contentType():String
        {
            if (this._Str_8352())
            {
                if (this.isInteractive())
                {
                    return "VPAID";
                }
                return "SWF";
            }
            if (this._Str_15494())
            {
                return "HTML";
            }
            if (this._Str_18935())
            {
                return "TEXT";
            }
            if (this.isIFrame())
            {
                return "IFRAME";
            }
            if (this.isScript())
            {
                return "SCRIPT";
            }
            return "IMAGE";
        }

        public function get content():String
        {
            if (this._Str_3937())
            {
                return this._Str_3366;
            }
            if (this._Str_4309())
            {
                return this._Str_577.getQualifiedStreamAddress();
            }
            return "";
        }

        public function rawContentAsObject():Object
        {
            return ({
                "type":this.contentType(),
                "format":((this._Str_3937()) ? "CODE" : "URL"),
                "content":this.content
            });
        }

        public function _Str_15494():Boolean
        {
            return (this._Str_22959()) || ((this._Str_11827()) && (this._Str_24969()));
        }

        public function _Str_8352():Boolean
        {
            return (this._Str_11827()) && (this._Str_22114());
        }

        public function isScript():Boolean
        {
            return (this._Str_23361()) || ((this._Str_11827()) && (this._Str_24291()));
        }

        public function _Str_20097():Boolean
        {
            return (this._Str_11827()) && (this.window7());
        }

        public function _Str_18935():Boolean
        {
            return this._Str_24510();
        }

        public function isIFrame():Boolean
        {
            return this._Str_22749();
        }

        public function _Str_24510():Boolean
        {
            if (this._Str_3532 != null)
            {
                return this._Str_3532.toUpperCase() == "TEXT";
            }
            return false;
        }

        public function _Str_22959():Boolean
        {
            if (this._Str_3532 != null)
            {
                return this._Str_3532.toUpperCase() == "HTML";
            }
            return false;
        }

        public function _Str_23361():Boolean
        {
            if (this._Str_3532 != null)
            {
                return this._Str_3532.toUpperCase() == "SCRIPT";
            }
            return false;
        }

        public function _Str_22749():Boolean
        {
            if (this._Str_3532 != null)
            {
                return this._Str_3532.toUpperCase() == "IFRAME";
            }
            return false;
        }

        public function _Str_11827():Boolean
        {
            if (this._Str_3532 != null)
            {
                return this._Str_3532.toUpperCase() == "STATIC";
            }
            return false;
        }

        public function _Str_19521():Boolean
        {
            return (this._Str_11827()) && (this._Str_24710() == false);
        }

        public function _Str_22114():Boolean
        {
            if (this.creativeType != null)
            {
                return (((this.creativeType.toUpperCase() == "APPLICATION/SWF") || (this.creativeType.toUpperCase() == "SWF")) || (this.creativeType.toUpperCase() == "APPLICATION/X-SHOCKWAVE-FLASH")) || (this.creativeType.toUpperCase() == "X-SHOCKWAVE-FLASH");
            }
            return false;
        }

        public function _Str_26206():Boolean
        {
            if (this.creativeType != null)
            {
                return this.creativeType.toUpperCase() == "TEXT";
            }
            return false;
        }

        public function _Str_24969():Boolean
        {
            if (this.creativeType != null)
            {
                return (this.creativeType.toUpperCase() == "HTML") || (this.creativeType.toUpperCase() == "TEXT/HTML");
            }
            return false;
        }

        public function _Str_24291():Boolean
        {
            if (this.creativeType != null)
            {
                return (this.creativeType.toUpperCase() == "TEXT/JAVASCRIPT") || (this.creativeType.toUpperCase() == "JAVASCRIPT");
            }
            return false;
        }

        public function window7():Boolean
        {
            return (((((((this.creativeType == "IMAGE/JPEG") || (this.creativeType == "JPEG")) || (this.creativeType == "IMAGE/JPG")) || (this.creativeType == "JPG")) || (this.creativeType == "IMAGE/GIF")) || (this.creativeType == "GIF")) || (this.creativeType == "IMAGE/PNG")) || (this.creativeType == "PNG");
        }

        public function hasAccompanyingVideoAd():Boolean
        {
            if (parentAdContainer != null)
            {
                return parentAdContainer.hasLinearAd();
            }
            return false;
        }

        public function _Str_18832(k:int, _arg_2:int, _arg_3:int):Boolean
        {
            if (this._Str_6420(k, _arg_2))
            {
                return _arg_3 == _index;
            }
            return false;
        }

        public function _Str_16909(k:int, _arg_2:int, _arg_3:String):Boolean
        {
            if (this._Str_6420(k, _arg_2))
            {
                if (((!(_arg_3 == null)) && (!(this._Str_3532 == null))))
                {
                    return this._Str_3532.toUpperCase() == _arg_3.toUpperCase();
                }
            }
            return false;
        }

        public function _Str_16856(k:int, _arg_2:int, _arg_3:String, _arg_4:String=null):Boolean
        {
            if (this._Str_6420(k, _arg_2))
            {
                if (((!(_arg_3 == null)) && (!(this._Str_4009 == null))))
                {
                    return (this._Str_4009.toUpperCase() == _arg_3.toUpperCase()) && (this._Str_3532.toUpperCase() == _arg_4.toUpperCase());
                }
                return this._Str_3532.toUpperCase() == _arg_4.toUpperCase();
            }
            return false;
        }

        public function _Str_6420(k:int, _arg_2:int):Boolean
        {
            if (((k == -1) && (_arg_2 == -1)))
            {
                return true;
            }
            if (k == -1)
            {
                return _arg_2 == this._height;
            }
            if (k == this._width)
            {
                return _arg_2 == this._height;
            }
            return false;
        }

        public function matchesAcceptedAdTypes(k:Array):Boolean
        {
            if (k != null)
            {
                if (k.length > 0)
                {
                    return k.indexOf(this.contentType()) > -1;
                }
            }
            return true;
        }

        public function matchesSizeAndAcceptedAdTypes(k:int, _arg_2:int, _arg_3:Array):Boolean
        {
            if (this.matchesAcceptedAdTypes(_arg_3))
            {
                return this._Str_6420(k, _arg_2);
            }
            return false;
        }

        public function deriveScoreBasedOnEstimatedSizeAndAcceptedAdTypes(k:int, _arg_2:int, _arg_3:Array):int
        {
            if (this.matchesAcceptedAdTypes(_arg_3))
            {
                if (scale == false)
                {
                    if (this._Str_18935())
                    {
                        return 0;
                    }
                    if (((this._height > _arg_2) || (this._width > k)))
                    {
                        return -1;
                    }
                    if (this._width > 0)
                    {
                        return k - this._width;
                    }
                    return -1;
                }
                return 0;
            }
            return -1;
        }

        public function set activeDisplayRegion(k:AdSlotRegionConfig):void
        {
            this._Str_9031 = k;
        }

        public function get activeDisplayRegion():AdSlotRegionConfig
        {
            return this._Str_9031;
        }

        public function hasActiveDisplayRegion():Boolean
        {
            return !(this._Str_9031 == null);
        }

        public function getActiveDisplayRegionID():String
        {
            if (this.hasActiveDisplayRegion())
            {
                return this._Str_9031._Str_25238(this.contentType());
            }
            return "auto:bottom";
        }

        public function clearActiveDisplayRegion():void
        {
            this.activeDisplayRegion = null;
        }

        public function getRawContent():String
        {
            if (this._Str_4309())
            {
                return this._Str_577.url;
            }
            return this._Str_3366;
        }

        public function getContent():String
        {
            if (this.hasActiveDisplayRegion())
            {
                return this._Str_9031._Str_23774(this.contentType()).getContent(this);
            }
            return "";
        }

        public function get enforceRecommendedSizing():Boolean
        {
            if (this.hasActiveDisplayRegion())
            {
                return this._Str_9031.enforceRecommendedSizing;
            }
            return false;
        }

        public function start(k:_Str_3019, _arg_2:*=null):void
        {
            this.activeDisplayRegion = _arg_2;
            triggerTrackingEvent(TrackingEvent.CREATIVEVIEW);
            triggerTrackingEvent(TrackingEvent.START);
            if (k.controller != null)
            {
                k.controller.onDisplayNonLinearAd(new _Str_2833(_Str_2833._Str_3831, this, k._Str_3073.adSlot, _arg_2));
            }
        }

        public function stop(k:_Str_3019, _arg_2:*=null):void
        {
            triggerTrackingEvent(TrackingEvent.COMPLETE);
            if (k.controller != null)
            {
                k.controller.onHideNonLinearAd(new _Str_2833(_Str_2833._Str_2703, this, k._Str_3073.adSlot, this.activeDisplayRegion));
            }
            this.activeDisplayRegion = null;
        }

        public function _Str_25878(k:NetworkResource):void
        {
            if (k != null)
            {
                this._Str_5280.push(k);
            }
        }

        public function _Str_21348(k:Array):void
        {
            if (k != null)
            {
                this._Str_5280 = this._Str_5280.concat(k);
            }
        }

        public function _Str_20657():Boolean
        {
            return this._Str_5280.length > 0;
        }

        public function _Str_22894():void
        {
            var k:int;
            if (this._Str_20657())
            {
                k = 0;
                while (k < this._Str_5280.length)
                {
                    this._Str_5280[k].call();
                    k++;
                }
            }
        }

        public function clicked():void
        {
            this._Str_22894();
            triggerTrackingEvent(TrackingEvent.ACCEPTINVITATION);
        }

        public function close():void
        {
            triggerTrackingEvent(TrackingEvent.CLOSE);
        }

        override public function clone(k:*=null):*
        {
            var _local_2:NonLinearVideoAd;
            if (k == null)
            {
                _local_2 = new NonLinearVideoAd();
            }
            else
            {
                _local_2 = k;
            }
            _local_2.width = this._width;
            _local_2.height = this._height;
            _local_2.expandedWidth = this._Str_5165;
            _local_2.expandedHeight = this._Str_5160;
            _local_2.recommendedMinDuration = _Str_6407;
            _local_2.resourceType = this._Str_3532;
            _local_2.creativeType = this._Str_4009;
            _local_2.apiFramework = this._Str_4949;
            _local_2.url = this._Str_577;
            _local_2.codeBlock = this._Str_3366;
            _local_2.scale = _scale;
            _local_2._Str_21348(this._Str_5280);
            return super.clone(_local_2);
        }

        override public function toJSObject():Object
        {
            var k:Object = super.toJSObject();
            k.width = this._width;
            k.height = this._height;
            k.expandedWidth = this._Str_5165;
            k.expandedHeight = this._Str_5160;
            k.scale = _scale;
            k.resourceType = this._Str_3532;
            k.creativeType = this._Str_4009;
            k.apiFramework = this._Str_4949;
            k.url = ((this._Str_577 != null) ? this._Str_577.url : "");
            k.codeblock = this._Str_3366;
            return k;
        }
    }
}
