package org.openvideoads.vast.schedule.ads
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.server.response._Str_3802;
    import org.openvideoads.vast.VASTController;
    import org.openvideoads.vast.server.request.AdServerRequestProcessor;
    import org.openvideoads.vast.schedule.StreamSequence;
    import org.openvideoads.vast.config.Config;
    import org.openvideoads.vast.server.response.AdServerTemplate;
    import org.openvideoads.vast.analytics._Str_2408;
    import org.openvideoads.vast.schedule._Str_4545;
    import flash.events.Event;
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.vast.tracking._Str_4278;

    public class AdSchedule extends Debuggable implements _Str_3802 
    {
        protected var _Str_2407:Array;
        protected var _Str_2335:VASTController = null;
        protected var _Str_17771:int = -1;
        protected var _Str_14472:AdServerRequestProcessor = null;
        protected var _Str_2922:_Str_3802 = null;
        protected var _Str_12448:Boolean = false;

        public function AdSchedule(k:VASTController, _arg_2:StreamSequence, _arg_3:Config=null, _arg_4:AdServerTemplate=null)
        {
            this._Str_2407 = new Array();
            super();
            this._Str_2335 = k;
            if (_arg_3 != null)
            {
                this.build(_arg_3, _arg_2, -1, true);
                if (_arg_4)
                {
                    this.schedule(_arg_4);
                }
            }
        }

        public function unload():void
        {
            var k:int;
            if (this._Str_14472 != null)
            {
                this._Str_14472.unload();
                if (this._Str_6852())
                {
                    k = 0;
                    while (k < this._Str_2407.length)
                    {
                        this._Str_2407[k].unload();
                        k++;
                    }
                }
            }
        }

        public function _Str_26181():Boolean
        {
            return this._Str_12448;
        }

        public function get analyticsProcessor():_Str_2408
        {
            if (this._Str_2335 != null)
            {
                return this._Str_2335.analyticsProcessor;
            }
            return null;
        }

        protected function _Str_26356(k:Array):int
        {
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < k.length)
            {
                if (k[_local_3].isStream())
                {
                    _local_2++;
                }
                _local_3++;
            }
            return _local_2;
        }

        public function get _Str_12339():Array
        {
            return this._Str_2407;
        }

        public function set _Str_12339(k:Array):void
        {
            this._Str_2407 = k;
        }

        public function addAdSlot(k:AdSlot):void
        {
            this._Str_2407.push(k);
        }

        public function _Str_6852():Boolean
        {
            return (this._Str_2407) && (this._Str_2407.length > 0);
        }

        public function _Str_18822():Boolean
        {
            return this._Str_2407.length > 0;
        }

        public function _Str_20425(k:int):void
        {
            var _local_2:AdSlot;
            if (this._Str_6852())
            {
                for each (_local_2 in this._Str_2407)
                {
                    if (_local_2.associatedStreamIndex == k)
                    {
                        _local_2.resetAllTrackingPoints();
                    }
                }
            }
        }

        public function _Str_19527():Boolean
        {
            var k:int;
            if (this._Str_18822())
            {
                k = 0;
                while (k < this._Str_2407.length)
                {
                    if (this._Str_2407[k].isLinear())
                    {
                        if (this._Str_12448)
                        {
                            return true;
                        }
                        if (!AdSlot(this._Str_2407[k]).videoAd.isEmpty())
                        {
                            return true;
                        }
                    }
                    k++;
                }
            }
            return false;
        }

        public function hasNonLinearAds():Boolean
        {
            var k:int;
            if (this._Str_18822())
            {
                k = 0;
                while (k < this._Str_2407.length)
                {
                    if (this._Str_2407[k].isNonLinear())
                    {
                        if (this._Str_12448)
                        {
                            return true;
                        }
                        if (AdSlot(this._Str_2407[k]).isEmpty() == false)
                        {
                            return true;
                        }
                    }
                    k++;
                }
            }
            return false;
        }

        public function _Str_24421(k:int):Boolean
        {
            return k < this.length;
        }

        public function _Str_4198(k:int):AdSlot
        {
            if (this._Str_24421(k))
            {
                return this._Str_2407[k];
            }
            return null;
        }

        public function _Str_26130(k:int, _arg_2:String):void
        {
            if (((this._Str_6852()) && (k < this._Str_2407.length)))
            {
                this._Str_2407[k].id = _arg_2;
            }
        }

        public function get length():int
        {
            return this._Str_2407.length;
        }

        private function _Str_20424(k:Object, _arg_2:Object):Object
        {
            var _local_3:Object = new Object();
            if (k != null)
            {
                if (k.hasOwnProperty("show"))
                {
                    _local_3.show = k.show;
                }
                if (k.hasOwnProperty("region"))
                {
                    _local_3.region = k.region;
                }
                if (k.hasOwnProperty("message"))
                {
                    _local_3.message = k.message;
                }
                if (k.hasOwnProperty("type"))
                {
                    _local_3.type = k.type;
                }
            }
            if (_arg_2 != null)
            {
                if (_arg_2.hasOwnProperty("show"))
                {
                    _local_3.show = _arg_2.show;
                }
                if (_arg_2.hasOwnProperty("region"))
                {
                    _local_3.region = _arg_2.region;
                }
                if (_arg_2.hasOwnProperty("message"))
                {
                    _local_3.message = _arg_2.message;
                }
                if (_arg_2.hasOwnProperty("type"))
                {
                    _local_3.type = _arg_2.type;
                }
            }
            return _local_3;
        }

        private function _Str_19154(k:*, _arg_2:*):Boolean
        {
            if (_arg_2 != undefined)
            {
                return _arg_2;
            }
            if (k != undefined)
            {
                return k;
            }
            return false;
        }

        public function _Str_19858(k:Boolean=false):void
        {
            var _local_2:int;
            if (this._Str_18822())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_2407.length)
                {
                    if ((((AdSlot(this._Str_2407[_local_2]).isEmpty()) && (AdSlot(this._Str_2407[_local_2]).loadOnDemand == false)) || (((AdSlot(this._Str_2407[_local_2]).isEmpty()) && (AdSlot(this._Str_2407[_local_2]).loadOnDemand == true)) && (AdSlot(this._Str_2407[_local_2])._Str_25264()))))
                    {
                        this._Str_2407[_local_2].processForcedImpression(k);
                    }
                    _local_2++;
                }
            }
        }

        private function _Str_25453(k:Object, _arg_2:int, _arg_3:Boolean=false, _arg_4:int=1, _arg_5:_Str_4545=null):Boolean
        {
            if (_arg_5 != null)
            {
                if (!_arg_5.isStream())
                {
                    return false;
                }
            }
            if (k.applyToParts != undefined)
            {
                if ((k.applyToParts is String))
                {
                    if (k.applyToParts.toUpperCase() == "LAST")
                    {
                        return (_arg_2 + 1) == _arg_4;
                    }
                    return false;
                }
                if ((k.applyToParts is Array))
                {
                    return k.applyToParts.indexOf(_arg_2) > -1;
                }
                return false;
            }
            return true;
        }

        public function _Str_21149(k:String, _arg_2:String, _arg_3:int, _arg_4:int):String
        {
            if (k != null)
            {
                return k;
            }
            if (_arg_2 == null)
            {
                return ((("overlay" + ":") + _arg_3) + ".") + _arg_4;
            }
            return (((_arg_2 + ":") + _arg_3) + ".") + _arg_4;
        }

        public function _Str_23072():Boolean
        {
            var k:int;
            if (this._Str_2407 != null)
            {
                k = 0;
                while (k < this._Str_2407.length)
                {
                    if (AdSlot(this._Str_2407[k]).loadOnDemand == false)
                    {
                        return true;
                    }
                    k++;
                }
            }
            return false;
        }

        public function _Str_23849(k:_Str_3802):void
        {
            this._Str_2922 = k;
            if (this._Str_2335.config.scheduleAds)
            {
                this._Str_14472 = new AdServerRequestProcessor(this, this._Str_2407);
                this._Str_14472.start();
            }
            else
            {
                if (this._Str_2922)
                {
                    this._Str_2922.onTemplateLoaded(new AdServerTemplate());
                }
            }
        }

        public function onTemplateLoaded(k:AdServerTemplate):void
        {
            if (this._Str_2922)
            {
                this._Str_2922.onTemplateLoaded(k);
            }
        }

        public function onTemplateLoadError(k:Event):void
        {
            if (this._Str_2922)
            {
                this._Str_2922.onTemplateLoadError(k);
            }
        }

        public function _Str_5807(k:Event):void
        {
            if (this._Str_2922)
            {
                this._Str_2922._Str_5807(k);
            }
        }

        public function _Str_5916(k:Event):void
        {
            if (this._Str_2922)
            {
                this._Str_2922._Str_5916(k);
            }
        }

        public function onAdCallStarted(k:AdServerRequest):void
        {
            if (this._Str_2922)
            {
                this._Str_2922.onAdCallStarted(k);
            }
        }

        public function onAdCallFailover(k:AdServerRequest, _arg_2:AdServerRequest):void
        {
            if (this._Str_2922)
            {
                this._Str_2922.onAdCallFailover(k, _arg_2);
            }
        }

        public function onAdCallComplete(k:AdServerRequest, _arg_2:Boolean):void
        {
            if (this._Str_2922)
            {
                this._Str_2922.onAdCallComplete(k, _arg_2);
            }
        }

        public function build(k:Config, _arg_2:StreamSequence, _arg_3:int=-1, _arg_4:Boolean=false):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:_Str_4545;
            var _local_9:Object;
            var _local_10:AdSlot;
            var _local_11:int;
            var _local_12:String;
            var _local_13:AdSlot;
            var _local_14:int;
            if (k._Str_8392)
            {
                _local_5 = ((k.streams.length == 0) ? 1 : k.streams.length);
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    if (_arg_3 == -1)
                    {
                        _arg_3 = k._Str_8392.length;
                    }
                    _local_7 = 0;
                    while (((_local_7 < k._Str_8392.length) && (_local_7 <= _arg_3)))
                    {
                        _local_8 = ((_local_6 < k.streams.length) ? k.streams[_local_6] : null);
                        if (this._Str_25453(k._Str_8392[_local_7], _local_6, _arg_4, _local_5, _local_8))
                        {
                            _local_9 = k._Str_8392[_local_7];
                            if ((_local_9.zone is String) == false)
                            {
                                _local_9.zone = new String(_local_9.zone);
                            }
                            if (((_local_9.zone) && (_local_9.zone.toUpperCase() == "STATIC")))
                            {
                                _local_10 = new _Str_11486(_arg_2, this, this._Str_2335, this._Str_2407.length, _local_6, this._Str_21149(_local_9.id, _local_9.position, _local_7, _local_6), _local_9.zone, _local_9.position, ((_local_9.applyToParts == undefined) ? null : (_local_9.applyToParts)), _local_9.duration, ((_local_9.startTime == undefined) ? "00:00:00" : (_local_9.startTime)), this._Str_20424(k.notice, _local_9.notice), this._Str_19154(k._Str_4565.shouldDisableControlsDuringLinearAds(), _local_9.disableControls), new Array(), ((_local_9.companionDivIDs == undefined) ? (k.companionDivIDs) : (_local_9.companionDivIDs)), ((_local_9.startPoint == undefined) ? null : (_local_9.startPoint)), ((_local_9.html == undefined) ? null : _local_9.html));
                            }
                            else
                            {
                                _local_12 = this._Str_21149(_local_9.id, _local_9.position, _local_7, _local_6);
                                _local_10 = new AdSlot(_arg_2, this, this._Str_2335, this._Str_2407.length, _local_6, _local_12, _local_9.zone, _local_9.position, ((_local_9.applyToParts == undefined) ? null : (_local_9.applyToParts)), _local_9.duration, _local_9.duration, ((_local_9.startTime == undefined) ? "00:00:00" : (_local_9.startTime)), this._Str_20424(k.notice, _local_9.notice), this._Str_19154(k._Str_4565.shouldDisableControlsDuringLinearAds(), _local_9.disableControls), new Array(), ((_local_9.companionDivIDs == undefined) ? (k.companionDivIDs) : (_local_9.companionDivIDs)), ((_local_9.streamType != undefined) ? _local_9.streamType : (k.streamType)), ((_local_9.deliveryType != undefined) ? _local_9.deliveryType : (k.deliveryType)), ((_local_9.bitrate != undefined) ? _local_9.bitrate : (k.bitrate)), ((_local_9.playOnce != undefined) ? _local_9.playOnce : (k.playOnce)), k.metaData, ((_local_9.autoPlay != undefined) ? _local_9.autoPlay : (k.autoPlay)), ((_local_9.regions != undefined) ? _local_9.regions : (null)), ((_local_9.player != undefined) ? _local_9.player : (k.adsConfig.player)), k._Str_16561, ((_local_9.server != undefined) ? _local_9.server : (null)), null, ((_local_9.loadOnDemand != undefined) ? StringUtils._Str_2810(_local_9.loadOnDemand) : (false)), ((_local_9.refreshOnReplay != undefined) ? StringUtils._Str_2810(_local_9.refreshOnReplay) : (false)), ((_local_9.hasOwnProperty("maxDisplayCount")) ? StringUtils._Str_24234(_local_9.maxDisplayCount) : -1));
                            }
                            _local_11 = ((_local_9.repeat == undefined) ? 1 : _local_9.repeat);
                            if (_local_11 > 1)
                            {
                                _local_13 = _local_10;
                                _local_14 = 0;
                                while (_local_14 < _local_11)
                                {
                                    this.addAdSlot(_local_13);
                                    _local_13 = _local_13.clone();
                                    _local_13.key = this._Str_2407.length;
                                    _local_14++;
                                }
                            }
                            else
                            {
                                this.addAdSlot(_local_10);
                            }
                            if (_local_10.loadOnDemand)
                            {
                                this._Str_12448 = true;
                            }
                        }
                        _local_7++;
                    }
                    _local_6++;
                }
                if (this._Str_12448)
                {
                }
            }
        }

        public function _Str_20275():void
        {
            var k:int;
            if (this._Str_2335 != null)
            {
                k = 0;
                while (k < this._Str_2407.length)
                {
                    if (AdSlot(this._Str_2407[k]).loadOnDemand)
                    {
                        this._Str_2335._Str_19790(this._Str_2407[k], true);
                    }
                    else
                    {
                        if (((!(this._Str_2407[k].isLinear())) && (this._Str_2407[k].hasNonLinearAds())))
                        {
                            this._Str_2335._Str_19790(this._Str_2407[k], false);
                        }
                    }
                    k++;
                }
            }
        }

        public function addNonLinearAdTrackingPoints(k:Boolean=true, _arg_2:Boolean=false):void
        {
            var _local_3:int;
            if (this._Str_6852())
            {
                while (_local_3 < this._Str_2407.length)
                {
                    if (this._Str_2407[_local_3].isNonLinear())
                    {
                        this._Str_2407[_local_3].addNonLinearAdTrackingPoints(_local_3, k, true, _arg_2);
                    }
                    _local_3++;
                }
            }
        }

        public function _Str_26032():Array
        {
            var k:Array = new Array();
            var _local_2:int;
            while (_local_2 < this._Str_2407.length)
            {
                if (((this._Str_2407[_local_2].id) && (!(this._Str_2407[_local_2].id == "popup"))))
                {
                    k.push(((this._Str_2407[_local_2].id + "-") + this._Str_2407[_local_2].associatedStreamIndex));
                }
                _local_2++;
            }
            return k;
        }

        public function get _Str_26141():Array
        {
            var _local_3:Object;
            var k:Array = new Array();
            var _local_2:int;
            while (_local_2 < this._Str_2407.length)
            {
                if (((this._Str_2407[_local_2].id) && (!(this._Str_2407[_local_2].id == "popup"))))
                {
                    _local_3 = new Object();
                    _local_3.id = ((this._Str_2407[_local_2].id + "-") + this._Str_2407[_local_2].associatedStreamIndex);
                    _local_3.zone = this._Str_2407[_local_2].zone;
                    k.push(_local_3);
                }
                _local_2++;
            }
            return k;
        }

        public function schedule(k:AdServerTemplate=null):void
        {
            var _local_2:int;
            if (this._Str_6852())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_2407.length)
                {
                    if (this._Str_2407[_local_2].id != null)
                    {
                        if (k != null)
                        {
                            this._Str_2407[_local_2].videoAd = k._Str_22289(((this._Str_2407[_local_2].id + "-") + this._Str_2407[_local_2].associatedStreamIndex));
                        }
                    }
                    _local_2++;
                }
            }
        }

        public function _Str_26370(k:int, _arg_2:int):void
        {
            if (this._Str_2407.length < k)
            {
                this._Str_2407[k].registerCompanionClickThrough(_arg_2);
            }
        }

        public function processTimeEvent(k:int, _arg_2:_Str_4278, _arg_3:Boolean=true):void
        {
            var _local_4:int;
            if (this._Str_6852())
            {
                _local_4 = 0;
                while (_local_4 < this._Str_2407.length)
                {
                    if (((this._Str_2407[_local_4].associatedStreamIndex == k) && (!(this._Str_2407[_local_4].isLinear()))))
                    {
                        this._Str_2407[_local_4].processTimeEvent(_arg_2, _arg_3, this._Str_2335.config.adsConfig.resetTrackingOnReplay);
                    }
                    _local_4++;
                }
                this._Str_17771 = k;
            }
        }

        public function closeActiveOverlaysAndCompanions(k:Boolean=false):void
        {
            var _local_2:int;
            if (this._Str_6852())
            {
                _local_2 = 0;
                while (_local_2 < this._Str_2407.length)
                {
                    if (this._Str_2407[_local_2].isPlaying())
                    {
                        this._Str_2407[_local_2].closeActiveOverlaysAndCompanions(k);
                    }
                    _local_2++;
                }
            }
        }

        public function _Str_23109(k:int, _arg_2:Number, _arg_3:Boolean=false):void
        {
            var _local_4:int;
            if (this._Str_6852())
            {
                _local_4 = 0;
                while (_local_4 < this._Str_2407.length)
                {
                    if (((this._Str_2407[_local_4].associatedStreamIndex == k) && (this._Str_2407[_local_4].isLinear() == false)))
                    {
                        if (((this._Str_2407[_local_4].isPlaying()) && (this._Str_2407[_local_4].shouldBePlaying(_arg_2) == false)))
                        {
                            this._Str_2407[_local_4].closeActiveOverlaysAndCompanions(_arg_3);
                        }
                    }
                    _local_4++;
                }
            }
        }
    }
}
