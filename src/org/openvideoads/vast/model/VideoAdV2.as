package org.openvideoads.vast.model
{
    public class VideoAdV2 extends VideoAd 
    {
        protected var _Str_22246:String;


        public function get _Str_22008():String
        {
            return this._Str_22246;
        }

        public function set _Str_22008(k:String):void
        {
            this._Str_22246 = k;
        }

        override public function injectAllTrackingData(k:VideoAd):VideoAd
        {
            var _local_2:int;
            k.addImpressions(_Str_3519);
            k.addTrackingEventItems(_Str_3053);
            if (_Str_2815 != null)
            {
                if ((k is VideoAdV2))
                {
                    k.linearVideoAd.addTrackingEventItems(_Str_2815.trackingEvents);
                    k.linearVideoAd.addClickTrackingItems(_Str_2815.clickTracking);
                    k.linearVideoAd.addCustomClickTrackingItems(_Str_2815.customClicks);
                }
                else
                {
                    k.addTrackingEventItems(_Str_2815.trackingEvents);
                    k.addClickTrackingItems(_Str_2815.clickTracking);
                    k.addCustomClickTrackingItems(_Str_2815.customClicks);
                }
            }
            if (hasNonLinearAds())
            {
                _local_2 = 0;
                while (_local_2 < _Str_2587.length)
                {
                    if (_local_2 < k.nonLinearVideoAds.length)
                    {
                        k.nonLinearVideoAds[_local_2].addTrackingEventItems(_Str_2587[_local_2].trackingEvents);
                    }
                    _local_2++;
                }
            }
            if (hasCompanionAds())
            {
            }
            return k;
        }

        public function _Str_23669():Boolean
        {
            if (hasLinearAd())
            {
                return _Str_2815.hasTrackingEvents();
            }
            return false;
        }

        override public function get trackingEvents():Array
        {
            if (isLinear())
            {
                return _Str_2815.trackingEvents;
            }
            return new Array();
        }

        public function _Str_24198():Boolean
        {
            var k:int;
            if (hasNonLinearAds())
            {
                k = 0;
                while (k < _Str_2587.length)
                {
                    if (_Str_2587[k].hasTrackingEvents())
                    {
                        return true;
                    }
                    k++;
                }
            }
            return false;
        }

        override public function hasTrackingEvents():Boolean
        {
            return (this._Str_23669()) || (this._Str_24198());
        }

        override protected function _triggerTrackingEvent(k:String, _arg_2:String=null):void
        {
            if (isLinear())
            {
                _Str_2815.triggerTrackingEvent(k);
                super._triggerTrackingEvent(k, _arg_2);
            }
            else
            {
                if (!isNonLinear())
                {
                    if (_Str_9554())
                    {
                    }
                }
            }
        }
    }
}
