package org.openvideoads.vast.playlist
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.schedule.Stream;
    import org.openvideoads.vast.config.groupings.ProvidersConfigGroup;
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.util.Timestamp;
    import org.openvideoads.util.StringUtils;

    public class DefaultPlaylistItem extends Debuggable implements _Str_3480 
    {
        protected var _Str_1430:Stream = null;
        protected var _Str_5596:Boolean = false;
        protected var _Str_5542:int = -1;
        protected var _Str_4904:String = "http";
        protected var _Str_20147:String = null;
        protected var _Str_1858:String = "Not available";
        protected var _Str_2495:String = "";
        protected var _Str_1676:String = "Not available";
        protected var _Str_18387:String = "Not available";
        protected var _Str_18379:String = "Not available";
        protected var _Str_2467:String = "00:00:00";
        protected var _Str_990:String = "00:00:00";
        protected var _Str_577:String = null;
        protected var _Str_1673:String = null;
        protected var _Str_2230:String = null;
        protected var _Str_4454:ProvidersConfigGroup = null;
        protected var _index:int = -1;

        public function DefaultPlaylistItem(k:int=-1)
        {
            this._index = k;
        }

        public function set guid(k:String):void
        {
            this._Str_18387 = k;
        }

        public function get guid():String
        {
            return this._Str_18387;
        }

        public function set index(k:int):void
        {
            this._index = k;
        }

        public function get index():int
        {
            return this._index;
        }

        public function set provider(k:String):void
        {
            this._Str_4904 = k;
        }

        public function get provider():String
        {
            return this._Str_4904;
        }

        public function set providers(k:ProvidersConfigGroup):void
        {
            this._Str_4454 = k;
        }

        public function get providers():ProvidersConfigGroup
        {
            return this._Str_4454;
        }

        public function set streamer(k:String):void
        {
            this._Str_20147 = k;
        }

        public function get streamer():String
        {
            return this._Str_20147;
        }

        public function set _Str_20606(k:String):void
        {
            this._Str_18379 = k;
        }

        public function get _Str_20606():String
        {
            return this._Str_18379;
        }

        public function _Str_12928():String
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430.previewImage;
            }
            return null;
        }

        public function _Str_24712():Boolean
        {
            return !(this._Str_12928() == null);
        }

        public function reset():void
        {
            this._Str_5596 = false;
        }

        public function rewind():void
        {
            if (this.playOnce == false)
            {
                this._Str_6097 = false;
            }
            this._Str_5542 = -1;
        }

        public function get playOnce():Boolean
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430.playOnce;
            }
            return false;
        }

        public function canPlay():Boolean
        {
            if (this.playOnce)
            {
                return !(this._Str_6097);
            }
            return true;
        }

        public function markAsPlayed():void
        {
            this._Str_6097 = true;
        }

        public function set _Str_6097(k:Boolean):void
        {
            this._Str_5596 = k;
        }

        public function get _Str_6097():Boolean
        {
            return this._Str_5596;
        }

        protected function _Str_26315():Boolean
        {
            return !(this._Str_1430 == null);
        }

        public function set stream(k:Stream):void
        {
            this._Str_1430 = k;
            this._Str_1430._Str_21333 = this;
        }

        public function get stream():Stream
        {
            return this._Str_1430;
        }

        public function get adSlot():AdSlot
        {
            return this._Str_1430 as AdSlot;
        }

        public function set title(k:String):void
        {
            this._Str_2495 = k;
        }

        public function get title():String
        {
            return this._Str_2495;
        }

        public function set link(k:String):void
        {
            this._Str_1676 = k;
        }

        public function get link():String
        {
            return this._Str_1676;
        }

        public function set description(k:String):void
        {
            this._Str_1858 = k;
        }

        public function get description():String
        {
            return this._Str_1858;
        }

        public function set duration(k:String):void
        {
            this._Str_2467 = k;
        }

        public function get duration():String
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430._Str_24960();
            }
            return this._Str_2467;
        }

        public function _Str_17310():int
        {
            if (this._Str_1430 != null)
            {
                if ((this._Str_1430 is AdSlot))
                {
                    return (this._Str_1430 as AdSlot)._Str_19793();
                }
                return this._Str_1430.getDurationAsInt();
            }
            return 0;
        }

        public function _Str_26008():String
        {
            return new String(this._Str_17310());
        }

        public function _Str_25907():int
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430._Str_21832();
            }
            return this._Str_17310();
        }

        public function _Str_9456():Boolean
        {
            return this._Str_5542 > -1;
        }

        public function set overrideStartTimeSeconds(k:int):void
        {
            this._Str_5542 = k;
        }

        public function _Str_24674():String
        {
            if (this._Str_1430 != null)
            {
                if ((this._Str_1430 is AdSlot))
                {
                    if (this._Str_9456())
                    {
                        return Timestamp._Str_4110(this._Str_5542);
                    }
                    return "00:00:00";
                }
                if (this._Str_9456())
                {
                    return Timestamp._Str_4110(this._Str_5542);
                }
                return this._Str_1430.startTime;
            }
            if (this._Str_9456())
            {
                return Timestamp._Str_4110(this._Str_5542);
            }
            return this._Str_990;
        }

        public function getStartTimeAsSeconds():int
        {
            if (this._Str_1430 != null)
            {
                if ((this._Str_1430 is AdSlot))
                {
                    if (this._Str_9456())
                    {
                        return this._Str_5542;
                    }
                    return 0;
                }
                if (this._Str_9456())
                {
                    return this._Str_5542;
                }
                return this._Str_1430.getStartTimeAsSeconds();
            }
            if (this._Str_9456())
            {
                return this._Str_5542;
            }
            return 0;
        }

        public function _Str_17397():String
        {
            return "Author not available";
        }

        public function getType():String
        {
            return (this.isRTMP()) ? "rtmp" : "http";
        }

        public function _Str_21970():String
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430.baseURL;
            }
            return null;
        }

        public function set filename(k:String):void
        {
            this._Str_1673 = k;
        }

        public function get filename():String
        {
            return this._Str_1673;
        }

        public function _Str_5059(k:Boolean=true):String
        {
            if (this._Str_1430 != null)
            {
                if (k)
                {
                    return this._Str_1430.streamName;
                }
                return this._Str_1430._Str_24252;
            }
            return this._Str_1673;
        }

        public function set url(k:String):void
        {
            this._Str_577 = k;
        }

        public function get url():String
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430.url;
            }
            return this._Str_577;
        }

        public function set mimeType(k:String):void
        {
            this._Str_2230 = k;
        }

        public function get mimeType():String
        {
            return this._Str_2230;
        }

        public function isInteractive():Boolean
        {
            if (this._Str_1430 != null)
            {
                if ((this._Str_1430 is AdSlot))
                {
                    return AdSlot(this._Str_1430).isInteractive();
                }
            }
            return false;
        }

        public function get loadOnDemand():Boolean
        {
            if (this._Str_1430 != null)
            {
                if ((this._Str_1430 is AdSlot))
                {
                    return AdSlot(this._Str_1430).loadOnDemand;
                }
            }
            return false;
        }

        public function getQualifiedStreamAddress():String
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430.getQualifiedStreamAddress();
            }
            if (this.url != null)
            {
                if (this.filename != null)
                {
                    if (StringUtils._Str_17635(StringUtils.trim(this.url), "/"))
                    {
                        if (!StringUtils._Str_4861(StringUtils.trim(this.filename), "/"))
                        {
                            return this.url + this.filename;
                        }
                        return this.url + StringUtils.trim(this.filename).substr(1);
                    }
                    if (StringUtils._Str_4861(StringUtils.trim(this.filename), "/"))
                    {
                        return this.url + this.filename;
                    }
                    return (this.url + "/") + this.filename;
                }
                return StringUtils.trim(this.url);
            }
            if (this.filename != null)
            {
                return this.filename;
            }
            return null;
        }

        public function _Str_16634():Boolean
        {
            return this._Str_1430 is AdSlot;
        }

        public function isRTMP():Boolean
        {
            if (this._Str_1430 != null)
            {
                return this._Str_1430.isRTMP();
            }
            return StringUtils._Str_4861(StringUtils.trim(this._Str_577), "rtmp://");
        }

        public function _Str_25252():Boolean
        {
            return !(this.isRTMP());
        }

        public function _Str_11204():void
        {
            if (this._Str_16634())
            {
                AdSlot(this._Str_1430)._Str_11204();
            }
        }

        public function _Str_10174():Boolean
        {
            if (this._Str_16634())
            {
                return AdSlot(this._Str_1430)._Str_10174();
            }
            return false;
        }

        public function _Str_22734():Boolean
        {
            return true;
        }

        public function toShowStreamConfigObject():Object
        {
            var k:Object = new Object();
            k.file = this.getQualifiedStreamAddress();
            k.duration = this.duration;
            return k;
        }

        public function toShortString(k:Boolean=false):String
        {
            return ((("{ type: " + ((this.isInteractive()) ? "interactive" : ((this.isRTMP()) ? "rtmp" : "http"))) + ", ") + this._Str_1430.toShortString()) + " }";
        }

        public function toString(k:Boolean=false):String
        {
            return (((((((((((((((((((((((((((((("{ type: " + ((this.isInteractive()) ? "interactive" : ((this.isRTMP()) ? "rtmp" : "http"))) + ", stream: (") + this._Str_1430) + ")") + ", played: ") + this._Str_5596) + ", overrideStartTimeSeconds: ") + this._Str_5542) + ", provider: ") + this._Str_4904) + ", description: ") + this._Str_1858) + ", title: ") + this._Str_2495) + ", link: ") + this._Str_1676) + ", guid: ") + this._Str_18387) + ", publishDate: ") + this._Str_18379) + ", startTime: ") + this._Str_990) + ", duration: ") + this._Str_2467) + ", url: ") + this._Str_577) + ", filename: ") + this._Str_1673) + ", mimeType: ") + this._Str_2230) + "}";
        }
    }
}
