package org.openvideoads.vast.model
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.Timestamp;
    import org.openvideoads.util.ArrayUtils;

    public class TrackedVideoAd extends Debuggable 
    {
        protected var _id:String;
        protected var _Str_9867:String;
        protected var _Str_3053:Array;
        protected var _Str_3772:Array;
        protected var _Str_4684:Array;
        protected var _Str_9886:Array;
        protected var _Str_4662:Array;
        protected var _Str_4070:VideoAd = null;
        protected var _scale:Boolean = false;
        protected var _Str_6419:Boolean = false;
        protected var _Str_6407:int = -1;
        protected var _index:int = -1;
        protected var _Str_15300:Boolean = false;

        public function TrackedVideoAd()
        {
            this._Str_3053 = new Array();
            this._Str_3772 = new Array();
            this._Str_4684 = new Array();
            this._Str_9886 = new Array();
            this._Str_4662 = new Array();
            super();
        }

        public function unload():void
        {
            var k:int;
            var _local_2:int;
            var _local_3:int;
            if (this._Str_18876())
            {
                k = 0;
                while (k < this._Str_4684.length)
                {
                    NetworkResource(this._Str_4684[k]).close();
                    k++;
                }
            }
            if (this._Str_24086())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_4662.length)
                {
                    NetworkResource(this._Str_4662[_local_2]).close();
                    _local_2++;
                }
            }
            if (this._Str_22268())
            {
                _local_3 = 0;
                while (_local_3 < this._Str_9886.length)
                {
                    NetworkResource(this._Str_9886[_local_3]).close();
                    _local_3++;
                }
            }
        }

        public function set id(k:String):void
        {
            this._id = k;
        }

        public function get id():String
        {
            return this._id;
        }

        public function set uid(k:String):void
        {
            _Str_2995 = uid;
        }

        public function set _Str_18431(k:String):void
        {
            this._Str_9867 = k;
        }

        public function get _Str_18431():String
        {
            return this._Str_9867;
        }

        public function get index():int
        {
            return this._index;
        }

        public function set index(k:int):void
        {
            this._index = k;
        }

        public function set isVAST2(k:Boolean):void
        {
            this._Str_15300 = k;
        }

        public function get isVAST2():Boolean
        {
            return this._Str_15300;
        }

        public function set scale(k:*):void
        {
            this._scale = StringUtils._Str_2810(k);
        }

        public function get scale():Boolean
        {
            return this._scale;
        }

        public function set maintainAspectRatio(k:*):void
        {
            this._Str_6419 = StringUtils._Str_2810(k);
        }

        public function get maintainAspectRatio():Boolean
        {
            return this._Str_6419;
        }

        public function get duration():String
        {
            return Timestamp._Str_4110(this._Str_6407);
        }

        public function getDurationAsInt():int
        {
            return Timestamp.timestampToSeconds(this.duration);
        }

        public function get recommendedMinDuration():int
        {
            return this._Str_6407;
        }

        public function set recommendedMinDuration(k:*):void
        {
            if (typeof(k) == "string")
            {
                this._Str_6407 = parseInt(k);
            }
            else
            {
                this._Str_6407 = k;
            }
        }

        public function hasRecommendedMinDuration():Boolean
        {
            return this._Str_6407 > -1;
        }

        public function set parentAdContainer(k:VideoAd):void
        {
            this._Str_4070 = k;
        }

        public function get parentAdContainer():VideoAd
        {
            return this._Str_4070;
        }

        public function set trackingEvents(k:Array):void
        {
            this._Str_3053 = k;
        }

        public function get trackingEvents():Array
        {
            return this._Str_3053;
        }

        public function hasTrackingEvents():Boolean
        {
            return this._Str_3053.length > 0;
        }

        public function _Str_10620(k:TrackingEvent):void
        {
            this._Str_3053.push(k);
        }

        public function addTrackingEventItems(k:Array):void
        {
            this._Str_3053 = this._Str_3053.concat(k);
        }

        public function triggerTrackingEvent(k:String):void
        {
            var _local_2:int;
            var _local_3:TrackingEvent;
            if (((!(this._Str_3053 == null)) && (!(k == null))))
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3053.length)
                {
                    _local_3 = this._Str_3053[_local_2];
                    if (_local_3.eventType != null)
                    {
                        if (_local_3.eventType.toUpperCase() == k.toUpperCase())
                        {
                            _local_3.execute();
                        }
                    }
                    _local_2++;
                }
            }
        }

        public function getTrackingEventList():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this.hasTrackingEvents())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3053.length)
                {
                    k.push({
                        "type":this._Str_3053[_local_2].eventType,
                        "urls":this._Str_3053[_local_2].getURLList()
                    });
                    _local_2++;
                }
            }
            return k;
        }

        public function _Str_26233(k:Array):void
        {
            if (this._Str_3772 != null)
            {
                this._Str_3772.concat(k);
            }
            else
            {
                this._Str_3772 = k;
            }
        }

        public function set clickThroughs(k:Array):void
        {
            this._Str_3772 = k;
        }

        public function get clickThroughs():Array
        {
            return this._Str_3772;
        }

        public function _Str_26023():int
        {
            return this._Str_3772.length;
        }

        public function getClickThroughURLString():String
        {
            if (this._Str_10419())
            {
                return this._Str_3772[0].qualifiedUrl;
            }
            return null;
        }

        public function _Str_26161():Array
        {
            var _local_2:int;
            var k:Array = new Array();
            if (this._Str_10419())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_3772.length)
                {
                    k.push(this._Str_3772[_local_2].qualifiedHTTPUrl);
                    _local_2++;
                }
            }
            return k;
        }

        public function _Str_7230(k:NetworkResource):void
        {
            this._Str_3772.push(k);
        }

        public function _Str_10419():Boolean
        {
            return this._Str_3772.length > 0;
        }

        public function _Str_6447():String
        {
            if (this._Str_10419())
            {
                return this._Str_3772[0].qualifiedHTTPUrl;
            }
            return null;
        }

        public function _Str_18876():Boolean
        {
            return this._Str_4684.length > 0;
        }

        public function set clickTracking(k:Array):void
        {
            this._Str_4684 = k;
        }

        public function get clickTracking():Array
        {
            return this._Str_4684;
        }

        public function _Str_26002():int
        {
            return this._Str_4684.length;
        }

        public function _Str_10053(k:NetworkResource):void
        {
            this._Str_4684.push(k);
        }

        public function fireClickTracking():void
        {
        }

        public function addClickTrackingItems(k:Array):void
        {
            if (k != null)
            {
                this._Str_4684 = this._Str_4684.concat(k);
            }
        }

        public function set customClicks(k:Array):void
        {
            this._Str_4662 = k;
        }

        public function get customClicks():Array
        {
            return this._Str_4662;
        }

        public function _Str_26329():int
        {
            return this._Str_4662.length;
        }

        public function _Str_10085(k:NetworkResource):void
        {
            this._Str_4662.push(k);
        }

        public function addCustomClickTrackingItems(k:Array):void
        {
            if (k != null)
            {
                this._Str_4662 = this._Str_4662.concat(k);
            }
        }

        public function _Str_24086():Boolean
        {
            return this._Str_4662.length > 0;
        }

        public function _Str_26040():void
        {
        }

        public function _Str_5569():Boolean
        {
            return this._Str_3772.length > 0;
        }

        public function _Str_22268():Boolean
        {
            if (this._Str_9886 != null)
            {
                return this._Str_9886.length > 0;
            }
            return false;
        }

        protected function _Str_25176(... k):*
        {
        }

        public function clone(k:*=null):*
        {
            var _local_2:TrackedVideoAd;
            var _local_3:TrackingEvent;
            var _local_4:NetworkResource;
            var _local_5:NetworkResource;
            var _local_6:NetworkResource;
            if (k == null)
            {
                _local_2 = new TrackedVideoAd();
            }
            else
            {
                _local_2 = k;
            }
            _local_2.id = this._id;
            _local_2.uid = _Str_2995;
            _local_2._Str_18431 = this._Str_9867;
            _local_2.parentAdContainer = this._Str_4070;
            _local_2.scale = this._scale;
            _local_2.maintainAspectRatio = this._Str_6419;
            _local_2.recommendedMinDuration = this._Str_6407;
            _local_2.index = this._index;
            _local_2.isVAST2 = this._Str_15300;
            for each (_local_3 in this._Str_3053)
            {
                _local_2._Str_10620(_local_3.clone());
            }
            for each (_local_4 in this._Str_3772)
            {
                _local_2._Str_7230(_local_4.clone());
            }
            for each (_local_5 in this._Str_4684)
            {
                _local_2._Str_10053(_local_5.clone());
            }
            for each (_local_6 in this._Str_4662)
            {
                _local_2._Str_10085(_local_6.clone());
            }
            return _local_2;
        }

        override public function toJSObject():Object
        {
            var k:Object = new Object();
            k = {
                "adId":this._Str_9867,
                "id":this._id,
                "uid":_Str_2995,
                "trackingEvents":ArrayUtils._Str_6975(this._Str_3053),
                "clickThroughs":ArrayUtils._Str_6975(this._Str_3772),
                "clickTracking":ArrayUtils._Str_6975(this._Str_4684),
                "customClicks":ArrayUtils._Str_6975(this._Str_4662),
                "scale":this._scale,
                "maintainAspectRatio":this._Str_6419,
                "recommendedMinDuration":this._Str_6407,
                "index":this._index,
                "isVAST2":this._Str_15300
            }
            return k;
        }
    }
}
