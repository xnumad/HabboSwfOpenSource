package org.openvideoads.vast.model
{
    import org.openvideoads.vast.server.response.AdServerTemplate;
    import org.openvideoads.vast.server.response._Str_3802;
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.vast.server.request.injected._Str_9148;
    import org.openvideoads.util._Str_9615;
    import flash.events.Event;
    import org.openvideoads.vast.analytics._Str_2408;
    import org.openvideoads.util.ObjectUtils;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.NetworkResource;
    import org.openvideoads.util.Timestamp;
    import flash.utils.ByteArray;
    import flash.events.*;
    import flash.net.*;
    import flash.xml.*;

    public class VideoAdServingTemplate extends AdServerTemplate implements _Str_3802 
    {
        public static const ALL:String = "ALL";
        public static const LINEAR:String = "LINEAR";
        public static const _Str_15460:String = "NON-LINEAR";

        protected var _Str_3517:Array;

        public function VideoAdServingTemplate(k:_Str_3802=null, _arg_2:AdServerRequest=null, _arg_3:Boolean=false, _arg_4:Array=null)
        {
            this._Str_3517 = new Array();
            super(k, _arg_2, _arg_3, _arg_4);
        }

        override public function load(k:AdServerRequest, _arg_2:Boolean=false):void
        {
            if (k != null)
            {
                if (!_arg_2)
                {
                    _Str_17208 = k;
                    _Str_15107(_Str_2995);
                }
                if ((k is _Str_9148))
                {
                    _Str_3081 = new _Str_9615();
                    _Str_3081.addEventListener(Event.COMPLETE, this.templateLoaded);
                    _Str_9615(_Str_3081).process(k.formRequest());
                }
                else
                {
                    this.loadTemplateData(k);
                }
            }
        }

        override protected function loadTemplateData(k:AdServerRequest):void
        {
            if (k != null)
            {
                super.loadTemplateData(k);
            }
        }

        public function canFireAPICalls():Boolean
        {
            return false;
        }

        public function canFireEventAPICalls():Boolean
        {
            return false;
        }

        public function get useV2APICalls():Boolean
        {
            return false;
        }

        public function get jsCallbackScopingPrefix():String
        {
            return "";
        }

        public function get analyticsProcessor():_Str_2408
        {
            if (_Str_2459 != null)
            {
                return _Str_2459.analyticsProcessor;
            }
            return null;
        }

        override protected function getReplacementAdId(k:String):String
        {
            var _local_2:Object;
            if (_Str_5528 != null)
            {
                for each (_local_2 in _Str_5528)
                {
                    if ((((_local_2.slotType == k) || ((_local_2.slotType + "-vpaid") == k)) && (_local_2.assigned == false)))
                    {
                        _local_2.assigned = true;
                        return _local_2.id;
                    }
                }
            }
            return k + ":not-scheduled";
        }

        protected function _Str_22874(k:int):Object
        {
            if (_Str_5528 != null)
            {
                if (k < _Str_5528.length)
                {
                    return _Str_5528[k];
                }
            }
            return ({
                "id":"no-id-found",
                "slotType":"unknown",
                "assigned":false
            });
        }

        protected function _Str_22853(k:String):String
        {
            var _local_2:Object;
            if (_Str_5528 != null)
            {
                for each (_local_2 in _Str_5528)
                {
                    if (_local_2.id == k)
                    {
                        return _local_2.slotType;
                    }
                }
            }
            return null;
        }

        override protected function templateLoaded(k:Event):void
        {
            _Str_6188 = _Str_3081.transformedData;
            this._Str_15022(_Str_6188);
            if (this.hasAds())
            {
                _Str_8445 = true;
                super.templateLoaded(k);
                return;
            }
            _Str_8445 = true;
            super.templateLoaded(k);
        }

        override protected function errorHandler(k:Event):void
        {
            _Str_6067(_Str_2995, k);
        }

        override protected function timeoutHandler(k:Event):void
        {
            _Str_8677(_Str_2995, k);
        }

        override public function filterLinearAdMediaFileByMimeType(k:Array):void
        {
            var _local_2:int;
            while (_local_2 < _Str_2518.length)
            {
                if (VideoAd(_Str_2518[_local_2]).isLinear())
                {
                    VideoAd(_Str_2518[_local_2]).filterLinearAdMediaFileByMimeType(k);
                }
                _local_2++;
            }
        }

        public function _Str_15022(rawData:*):void
        {
            var xmlData:XML;
            var tagName:String;
            if (rawData != null)
            {
                XML.ignoreWhitespace = true;
                try
                {
                    xmlData = new XML(rawData);
                    if (xmlData != null)
                    {
                        if (xmlData.length() > 0)
                        {
                            tagName = xmlData.name();
                            if (tagName != null)
                            {
                                if (tagName.indexOf("VAST") > -1)
                                {
                                    if ((((xmlData.attribute("version") == "2.0") || (xmlData.attribute("version") == "2.0.0")) || (xmlData.attribute("version") == "2.0.1")))
                                    {
                                        this.parseAdSpecs_V2(xmlData.Ad);
                                    }
                                }
                                else
                                {
                                    if (tagName.indexOf("VideoAdServingWrapper") <= -1)
                                    {
                                        if (((!(xmlData.Video == undefined)) || (!(xmlData.NonLinearAds == undefined))))
                                        {
                                            this._Str_23460(xmlData);
                                        }
                                        else
                                        {
                                            this.parseAdSpecs_V1_X(xmlData.children());
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                catch(errObject:Error)
                {
                }
            }
        }

        private function _Str_23460(k:XML):void
        {
            var _local_2:VideoAd = this.parseInlineAd_V1_X(0, "no-id", k, LINEAR);
            if (_local_2 != null)
            {
                _Str_3462(_local_2);
            }
            _local_2 = this.parseInlineAd_V1_X(1, "no-id", k, _Str_15460);
            if (_local_2 != null)
            {
                _Str_3462(_local_2);
            }
        }

        private function parseAdSpecs_V1_X(k:XMLList):void
        {
            var _local_3:XMLList;
            var _local_4:VideoAd;
            var _local_5:Array;
            var _local_6:String;
            var _local_7:String;
            var _local_8:VideoAd;
            var _local_2:int;
            while (_local_2 < k.length())
            {
                _local_3 = k[_local_2].attribute("id");
                if (k[_local_2].children().length() == 1)
                {
                    _local_4 = this.parseAdResponse_V1_X(_local_2, _local_3[0], k[_local_2]);
                    if (_local_4 != null)
                    {
                        if (_local_4._Str_25585("OpenX"))
                        {
                            _Str_3462(_local_4);
                        }
                        else
                        {
                            if (_Str_14997() == false)
                            {
                                _Str_3462(_local_4);
                            }
                            else
                            {
                                if (_local_4._Str_23787())
                                {
                                    _local_5 = _local_4.split();
                                    _local_6 = _local_4.id;
                                    _local_7 = this._Str_22853(_local_6);
                                    for each (_local_8 in _local_5)
                                    {
                                        if (((_local_7 == "linear") && (_local_8.isLinear())))
                                        {
                                            _local_8.id = _local_6;
                                            _local_7 = null;
                                        }
                                        else
                                        {
                                            if (((_local_7 == "non-linear") && (_local_8.isNonLinear())))
                                            {
                                                _local_8.id = _local_6;
                                                _local_7 = null;
                                            }
                                            else
                                            {
                                                _local_8.id = this.getReplacementAdId(((_local_8.isNonLinear()) ? "non-linear" : "linear"));
                                            }
                                        }
                                        _Str_3462(_local_8);
                                    }
                                }
                                else
                                {
                                    _Str_3462(_local_4);
                                }
                            }
                        }
                    }
                }
                _local_2++;
            }
        }

        private function parseAdResponse_V1_X(k:int, _arg_2:String, _arg_3:XML):VideoAd
        {
            if (_arg_3.InLine != undefined)
            {
                return this.parseInlineAd_V1_X(k, _arg_2, _arg_3.children()[0], ALL);
            }
            if (_arg_3.Wrapper != undefined)
            {
                return this.parseWrappedAd_V1_X(k, _arg_2, _arg_3.children()[0]);
            }
            return null;
        }

        private function parseWrappedAd_V1_X(k:int, _arg_2:String, _arg_3:XML):WrappedVideoAdV1
        {
            if (_arg_3.children().length() > 0)
            {
                return new WrappedVideoAdV1(this._Str_22874(k), _arg_3, this, _Str_18666());
            }
            return null;
        }

        private function parseInlineAd_V1_X(k:int, _arg_2:String, _arg_3:XML, _arg_4:String="ALL"):VideoAd
        {
            var _local_5:VideoAd;
            if (_arg_3.children().length() > 0)
            {
                _local_5 = new VideoAd();
                _local_5.adSystem = _arg_3.AdSystem;
                _local_5.adTitle = _arg_3.AdTitle;
                _local_5.adId = _arg_2;
                _local_5.description = _arg_3.Description;
                if (_arg_3.Survey != null)
                {
                    if (_arg_3.Survey.URL != undefined)
                    {
                        _local_5.survey = _arg_3.Survey.URL;
                    }
                    else
                    {
                        _local_5.survey = _arg_3.Survey;
                    }
                }
                _local_5.error = _arg_3.Error;
                _local_5._Str_16323(_arg_3);
                _local_5._Str_18315(_arg_3);
                if ((((_arg_4 == LINEAR) || (_arg_4 == ALL)) && (!(_arg_3.Video == undefined))))
                {
                    _local_5._Str_24028(_arg_3, -1, _Str_5664());
                }
                if ((((_arg_4 == _Str_15460) || (_arg_4 == ALL)) && (!(_arg_3.NonLinearAds == undefined))))
                {
                    _local_5._Str_24780(_arg_3);
                }
                if (_arg_3.CompanionAds != undefined)
                {
                    _local_5._Str_24076(_arg_3);
                }
                _local_5._Str_25118(_arg_3);
                if (_Str_13492())
                {
                    _local_5.id = this.getReplacementAdId(((_local_5.isNonLinear()) ? "non-linear" : "linear"));
                }
                else
                {
                    _local_5.id = _arg_2;
                }
                return _local_5;
            }
            return null;
        }

        public function onTemplateLoaded(k:AdServerTemplate):void
        {
            if ((k is WrappedVideoAdServingTemplateV2))
            {
                _Str_11882(k, true, true);
            }
            else
            {
                _Str_11882(k);
            }
            _Str_6919(k.uid);
        }

        public function onTemplateLoadError(k:Event):void
        {
            _Str_6067(uid, k);
        }

        public function _Str_5807(k:Event):void
        {
            _Str_8677(uid, k);
        }

        public function _Str_5916(k:Event):void
        {
            _Str_16343(uid, k);
        }

        public function onAdCallStarted(k:AdServerRequest):void
        {
            if (_Str_2459 != null)
            {
                _Str_2459.onAdCallStarted(k);
            }
        }

        public function onAdCallFailover(k:AdServerRequest, _arg_2:AdServerRequest):void
        {
            if (_Str_2459 != null)
            {
                _Str_2459.onAdCallFailover(k, _arg_2);
            }
        }

        public function onAdCallComplete(k:AdServerRequest, _arg_2:Boolean):void
        {
            if (_Str_2459 != null)
            {
                _Str_2459.onAdCallComplete(k, _arg_2);
            }
        }

        protected function parseAdSpecs_V2(k:XMLList):void
        {
            var _local_3:XMLList;
            var _local_2:int;
            while (_local_2 < k.length())
            {
                _local_3 = k[_local_2].attribute("id");
                if (k[_local_2].children().length() == 1)
                {
                    this.parseAdResponse_V2(_local_2, _local_3[0], k[_local_2]);
                }
                _local_2++;
            }
        }

        private function parseAdResponse_V2(k:int, _arg_2:String, _arg_3:XML):void
        {
            if (_arg_3 != null)
            {
                if (_arg_3.InLine != undefined)
                {
                    this.parseInlineAd_V2(k, _arg_2, _arg_3.children()[0]);
                }
                else
                {
                    if (_arg_3.Wrapper != undefined)
                    {
                        this.parseWrappedAd_V2(k, _arg_2, _arg_3.children()[0]);
                    }
                }
            }
        }

        private function parseWrappedAd_V2(k:int, _arg_2:String, _arg_3:XML):WrappedVideoAdServingTemplateV2
        {
            if (_arg_3.children().length() > 0)
            {
                return new WrappedVideoAdServingTemplateV2(k, _arg_2, _arg_3, this);
            }
            return null;
        }

        private function _Str_24753(k:XML):Array
        {
            var _local_3:XMLList;
            var _local_4:XML;
            var _local_2:Array = new Array();
            if (k.Impression != null)
            {
                _local_3 = k.Impression;
                for each (_local_4 in _local_3)
                {
                    _local_2.push(new Impression(_local_4.@id, _local_4.text()));
                }
            }
            return _local_2;
        }

        private function _Str_23240(k:XML):Object
        {
            var _local_5:XMLList;
            var _local_6:XML;
            var _local_7:Object;
            var _local_2:Array = new Array();
            var _local_3:Array = new Array();
            if (k.Extensions != null)
            {
                _local_5 = k.Extensions.children();
                for each (_local_6 in _local_5)
                {
                    if (_local_6.@type == "ad_playtype")
                    {
                        _local_3.push(new Impression("ad_playtype", _local_6.children().toXMLString()));
                    }
                    else
                    {
                        _local_7 = new Object();
                        _local_7.label = ((_local_6.@type != null) ? new String(_local_6.@type) : "undefined");
                        _local_7.text = _local_6.children().toXMLString();
                        _local_2.push(_local_7);
                    }
                }
            }
            var _local_4:Object = {
                "extensions":_local_2,
                "impressions":_local_3
            }
            return _local_4;
        }

        protected function createVideoAd_V2(k:String, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:String):VideoAd
        {
            var _local_8:VideoAdV2 = new VideoAdV2();
            if (_Str_13492())
            {
                _local_8.id = this.getReplacementAdId(_arg_5);
            }
            else
            {
                _local_8.id = k;
            }
            _local_8._Str_22008 = _arg_7;
            _local_8.inlineAdId = _arg_6;
            _local_8.adId = k;
            _local_8.creativeId = _arg_3;
            _local_8.sequenceId = _arg_4;
            _local_8.adSystem = _arg_2.AdSystem;
            _local_8.adTitle = _arg_2.AdTitle;
            _local_8.description = _arg_2.Description;
            _local_8.survey = _arg_2.Survey;
            _local_8.error = _arg_2.Error;
            return _local_8;
        }

        private function _Str_14144(k:Array, _arg_2:VideoAd):Array
        {
            var _local_4:CompanionAd;
            var _local_5:CompanionAd;
            var _local_3:Array = new Array();
            for each (_local_5 in k)
            {
                _local_4 = _local_5.clone();
                _local_4.parentAdContainer = _arg_2;
                _local_3.push(_local_4);
            }
            return _local_3;
        }

        private function _Str_20182(k:Array, _arg_2:Array):Array
        {
            if (k == null)
            {
                k = new Array();
            }
            if (_arg_2 == null)
            {
                return k;
            }
            return k.concat(_arg_2);
        }

        protected function parseInlineAd_V2(k:int, _arg_2:String, _arg_3:XML):Array
        {
            var _local_7:Object;
            var _local_8:XMLList;
            var _local_9:Array;
            var _local_10:int;
            var _local_11:Object;
            var _local_12:VideoAd;
            var _local_13:XMLList;
            var _local_14:int;
            var _local_15:Array;
            var _local_16:Array;
            var _local_17:Array;
            var _local_18:XML;
            var _local_19:String;
            var _local_20:String;
            var _local_21:String;
            var _local_22:VideoAd;
            var _local_23:LinearVideoAd;
            var _local_4:Array = new Array();
            var _local_5:Array = new Array();
            var _local_6:String = ObjectUtils._Str_22043();
            if (_arg_3.children().length() > 0)
            {
                _local_7 = this._Str_23240(_arg_3);
                _local_5 = _local_7.extensions;
                _local_4 = this._Str_24753(_arg_3);
                if (_local_7.impressions.length > 0)
                {
                    _local_4 = _local_4.concat(_local_7.impressions);
                }
                _local_8 = _arg_3.Creatives;
                if (_local_8 != null)
                {
                    _local_9 = new Array();
                    _local_10 = 0;
                    while (_local_10 < _local_8.length())
                    {
                        _local_13 = _local_8[_local_10].Creative;
                        if (_local_13 != null)
                        {
                            _local_14 = 1;
                            _local_15 = new Array();
                            _local_16 = new Array();
                            _local_17 = new Array();
                            for each (_local_18 in _local_13)
                            {
                                _local_19 = _local_18.attribute("AdID");
                                _local_20 = _local_18.attribute("id");
                                _local_21 = _local_18.attribute("sequence");
                                this._Str_22765();
                                _local_15 = this._Str_24274(_local_18.Linear);
                                _local_16 = this._Str_25355(_local_18.NonLinearAds);
                                _local_17 = this._Str_25848(_local_18.CompanionAds);
                                _local_22 = null;
                                for each (_local_23 in _local_15)
                                {
                                    _local_22 = this.createVideoAd_V2(_local_19, _arg_3, _local_20, _local_21, VideoAd.LINEAR, _local_6, _arg_2);
                                    if (_local_4.length > 0)
                                    {
                                        _local_22.impressions = _local_4;
                                    }
                                    if (_local_5.length > 0)
                                    {
                                        _local_22.extensions = _local_5;
                                    }
                                    _local_22.linearVideoAd = _local_23;
                                    if (_local_17.length > 0)
                                    {
                                        _local_22.companionAds = this._Str_14144(_local_17, _local_22);
                                    }
                                    _Str_3462(_local_22);
                                }
                                if (_local_16.length > 0)
                                {
                                    _local_22 = this.createVideoAd_V2(_local_19, _arg_3, _local_20, _local_21, VideoAd._Str_6723, _local_6, _arg_2);
                                    if (_local_4.length > 0)
                                    {
                                        _local_22.impressions = _local_4;
                                    }
                                    if (_local_5.length > 0)
                                    {
                                        _local_22.extensions = _local_5;
                                    }
                                    _local_22.nonLinearVideoAds = _local_16;
                                    if (_local_17.length > 0)
                                    {
                                        _local_22.companionAds = this._Str_14144(_local_17, _local_22);
                                    }
                                    _Str_3462(_local_22);
                                }
                                if (((((_local_15.length == 0) && (_local_16.length == 0)) && (_local_17.length > 0)) || (false)))
                                {
                                    _local_22 = this.createVideoAd_V2(_local_19, _arg_3, _local_20, _local_21, VideoAd.COMPANION, _local_6, _arg_2);
                                    if (_local_4.length > 0)
                                    {
                                        _local_22.impressions = _local_4;
                                    }
                                    if (_local_5.length > 0)
                                    {
                                        _local_22.extensions = _local_5;
                                    }
                                    _local_22.companionAds = _local_17;
                                    _Str_3462(_local_22);
                                    _local_9.push({
                                        "adId":_local_19,
                                        "creativeId":_local_20,
                                        "sequenceId":_local_21,
                                        "companions":_local_17
                                    });
                                }
                                if ((((((_local_15.length == 0) && (_local_16.length == 0)) && (_local_17.length == 0)) && (hasAds(true) == false)) && (_local_4.length > 0)))
                                {
                                    _local_22 = this.createVideoAd_V2(_local_19, _arg_3, _local_20, _local_21, VideoAd.LINEAR, _local_6, _arg_2);
                                    _local_22.impressions = _local_4;
                                    _Str_3462(_local_22);
                                }
                                _local_14++;
                            }
                        }
                        _local_10++;
                    }
                    for each (_local_11 in _local_9)
                    {
                        for each (_local_12 in _Str_2518)
                        {
                            if (_local_12._Str_19109(_local_6))
                            {
                                if (((!(_local_12.adType == VideoAd.COMPANION)) && (!(_local_12.hasCompanionAds()))))
                                {
                                    if (((StringUtils.isEmpty(_local_11.creativeId)) && (StringUtils.isEmpty(_local_11.sequenceId))))
                                    {
                                        _local_12.companionAds = this._Str_20182(_local_12.companionAds, this._Str_14144(_local_11.companions, _local_12));
                                    }
                                }
                            }
                        }
                    }
                    for each (_local_11 in _local_9)
                    {
                        for each (_local_12 in _Str_2518)
                        {
                            if (_local_12._Str_19109(_local_6))
                            {
                                if (_local_12.adType != VideoAd.COMPANION)
                                {
                                    if ((((!(_local_12.sequenceId == null)) && (_local_12.sequenceId == _local_11.sequenceId)) || ((!(_local_12.creativeId == null)) && (_local_12.creativeId == _local_11.creativeId))))
                                    {
                                        _local_12.companionAds = this._Str_20182(_local_12.companionAds, this._Str_14144(_local_11.companions, _local_12));
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return _local_4;
        }

        protected function _Str_22765():void
        {
            this._Str_3517 = new Array();
        }

        protected function _Str_17110(k:int, _arg_2:int):int
        {
            var _local_3:int;
            while (_local_3 < this._Str_3517.length)
            {
                if (((this._Str_3517[_local_3].width == k) && (this._Str_3517[_local_3].height == _arg_2)))
                {
                    this._Str_3517[_local_3].index = (this._Str_3517[_local_3].index + 1);
                    return this._Str_3517[_local_3].index;
                }
                _local_3++;
            }
            this._Str_3517.push({
                "width":k,
                "height":_arg_2,
                "index":0
            });
            return 0;
        }

        protected function _Str_24274(k:XMLList):Array
        {
            var _local_3:XML;
            var _local_4:LinearVideoAd;
            var _local_5:String;
            var _local_6:XMLList;
            var _local_7:XML;
            var _local_8:XML;
            var _local_9:XML;
            var _local_10:XMLList;
            var _local_11:MediaFile;
            var _local_12:int;
            var _local_13:XML;
            var _local_14:String;
            var _local_15:NetworkResource;
            var _local_16:XMLList;
            var _local_17:int;
            var _local_18:XML;
            var _local_19:TrackingEvent;
            var _local_20:XMLList;
            var _local_2:Array = new Array();
            if (k.length() > 0)
            {
                for each (_local_3 in k)
                {
                    _local_4 = new LinearVideoAd();
                    _local_5 = null;
                    _local_4.index = k.length();
                    if (Timestamp.validate(_local_3.Duration))
                    {
                        _local_4.duration = _local_3.Duration;
                    }
                    else
                    {
                        _local_4.duration = Timestamp._Str_16820(_local_3.Duration);
                    }
                    if (_local_3.AdParameters != undefined)
                    {
                        _local_5 = _local_3.AdParameters;
                    }
                    else
                    {
                        _local_5 = null;
                    }
                    if (_local_3.VideoClicks != undefined)
                    {
                        if (_local_3.VideoClicks.ClickThrough != undefined)
                        {
                            for each (_local_7 in _local_3.VideoClicks.ClickThrough)
                            {
                                if (!StringUtils.isEmpty(_local_7.text()))
                                {
                                    _local_4._Str_7230(new NetworkResource(_local_7.@id, _local_7.text()));
                                }
                            }
                        }
                        if (_local_3.VideoClicks.ClickTracking != undefined)
                        {
                            for each (_local_8 in _local_3.VideoClicks.ClickTracking)
                            {
                                if (!StringUtils.isEmpty(_local_8.text()))
                                {
                                    _local_4._Str_10053(new NetworkResource(_local_8.@id, _local_8.text()));
                                }
                            }
                        }
                        if (_local_3.VideoClicks.CustomClick != undefined)
                        {
                            for each (_local_9 in _local_3.VideoClicks.CustomClick)
                            {
                                if (!StringUtils.isEmpty(_local_9.text()))
                                {
                                    _local_4._Str_10085(new NetworkResource(_local_9.@id, _local_9.text()));
                                }
                            }
                        }
                    }
                    if (_local_3.MediaFiles != undefined)
                    {
                        _local_10 = _local_3.MediaFiles.children();
                        _local_12 = 0;
                        while (_local_12 < _local_10.length())
                        {
                            _local_11 = null;
                            _local_13 = _local_10[_local_12];
                            if (StringUtils.isEmpty(_local_13.text()) == false)
                            {
                                if (_Str_12713(_local_13.@type))
                                {
                                    if (StringUtils._Str_2576(_local_13.@apiFramework, "VPAID"))
                                    {
                                        if (_local_13.@type != undefined)
                                        {
                                            _local_14 = _local_13.@type;
                                            if (((StringUtils._Str_2576(_local_14, "APPLICATION/X-SHOCKWAVE-FLASH")) || (StringUtils._Str_2576(_local_14, "SWF"))))
                                            {
                                                _local_11 = new VPAIDMediaFile();
                                            }
                                        }
                                        else
                                        {
                                            _local_15 = new NetworkResource(_local_13.@id, _local_13.text());
                                            if (!_local_15.isStream())
                                            {
                                                _local_11 = new VPAIDMediaFile();
                                            }
                                        }
                                    }
                                    if (_local_11 == null)
                                    {
                                        _local_11 = new MediaFile();
                                    }
                                    _local_11.id = _local_13.@id;
                                    _local_11.bandwidth = _local_13.@bandwidth;
                                    _local_11.delivery = _local_13.@delivery;
                                    _local_11.mimeType = _local_13.@type;
                                    _local_11.bitRate = int(_local_13.@bitrate);
                                    _local_11.width = _local_13.@width;
                                    _local_11.height = _local_13.@height;
                                    _local_11.scale = _local_13.@scalable;
                                    _local_11.maintainAspectRatio = _local_13.@maintainAspectRatio;
                                    _local_11.apiFramework = _local_13.@apiFramework;
                                    if (_local_5 != null)
                                    {
                                        _local_11.adParameters = _local_5;
                                    }
                                    _local_11.url = new AdNetworkResource(_local_13.@id, _local_13.text(), _local_13.@type);
                                    _local_11._Str_19024 = _local_4;
                                    _local_4._Str_19374(_local_11);
                                }
                            }
                            _local_12++;
                        }
                    }
                    if (((!(_local_3.TrackingEvents == undefined)) && (!(_local_3.TrackingEvents.children() == null))))
                    {
                        _local_16 = _local_3.TrackingEvents.children();
                        _local_17 = 0;
                        while (_local_17 < _local_16.length())
                        {
                            _local_18 = _local_16[_local_17];
                            _local_19 = new TrackingEvent(_local_18.@event);
                            _local_20 = _local_18.children();
                            _local_19._Str_9951(new NetworkResource(_local_16[_local_17].@event, _local_16[_local_17].text()));
                            _local_4._Str_10620(_local_19);
                            _local_17++;
                        }
                    }
                    _local_2.push(_local_4);
                }
            }
            return _local_2;
        }

        protected function _Str_25355(k:XMLList):Array
        {
            var _local_3:XML;
            var _local_4:XMLList;
            var _local_5:int;
            var _local_6:Array;
            var _local_7:String;
            var _local_8:XML;
            var _local_9:NonLinearVideoAd;
            var _local_10:String;
            var _local_11:XML;
            var _local_12:XMLList;
            var _local_13:int;
            var _local_14:XML;
            var _local_15:TrackingEvent;
            var _local_16:XMLList;
            var _local_17:NonLinearVideoAd;
            var _local_2:Array = new Array();
            if (k.length() > 0)
            {
                for each (_local_3 in k)
                {
                    _local_4 = _local_3.children();
                    _local_5 = 0;
                    _local_6 = null;
                    _local_7 = null;
                    _local_5 = 0;
                    while (_local_5 < _local_4.length())
                    {
                        if (_local_4[_local_5].name() == "NonLinear")
                        {
                            _local_8 = _local_4[_local_5];
                            _local_9 = null;
                            _local_10 = ((_local_8.@id != undefined) ? _local_8.@id : ("" + _local_5));
                            if (((!(_local_8.StaticResource == undefined)) && (!(_local_8.StaticResource == null))))
                            {
                                if (((!(_local_8.StaticResource.@creativeType == undefined)) && (!(_local_8.StaticResource.@creativeType == null))))
                                {
                                    switch (_local_8.StaticResource.@creativeType.toUpperCase())
                                    {
                                        case "IMAGE/JPEG":
                                        case "JPEG":
                                        case "IMAGE/GIF":
                                        case "GIF":
                                        case "IMAGE/PNG":
                                        case "PNG":
                                            _local_9 = new _Str_5606();
                                            break;
                                        case "APPLICATION/X-SHOCKWAVE-FLASH":
                                        case "SWF":
                                            if (StringUtils._Str_2576(_local_8.@apiFramework, "VPAID"))
                                            {
                                                _local_9 = new VPAIDNonLinearAd();
                                            }
                                            else
                                            {
                                                _local_9 = new _Str_4713();
                                            }
                                            break;
                                        case "SCRIPT":
                                        case "JAVASCRIPT":
                                        case "TEXT/JAVASCRIPT":
                                        case "TEXT/SCRIPT":
                                            _local_9 = new _Str_4867();
                                            break;
                                        default:
                                            _local_9 = new NonLinearVideoAd();
                                    }
                                    _local_9.resourceType = "static";
                                    _local_9.creativeType = _local_8.StaticResource.@creativeType;
                                }
                                else
                                {
                                    _local_9 = new NonLinearVideoAd();
                                }
                            }
                            else
                            {
                                if (((!(_local_8.HTMLResource == undefined)) && (!(_local_8.HTMLResource == null))))
                                {
                                    if (StringUtils._Str_4861(_local_8.HTMLResource.text(), "<script "))
                                    {
                                        _local_9 = new _Str_4867();
                                    }
                                    else
                                    {
                                        _local_9 = new _Str_6389();
                                        _local_9.resourceType = "static";
                                        _local_9.creativeType = "html";
                                    }
                                }
                                else
                                {
                                    if (_local_8.IFrameResource != undefined)
                                    {
                                        _local_9 = new _Str_6437();
                                        _local_9.resourceType = "iframe";
                                        _local_9.creativeType = "html";
                                    }
                                    else
                                    {
                                        _local_9 = new NonLinearVideoAd();
                                    }
                                }
                            }
                            _local_9.index = _local_5;
                            _local_9.id = _local_10;
                            _local_9.width = _local_8.@width;
                            _local_9.height = _local_8.@height;
                            _local_9.apiFramework = _local_8.@apiFramework;
                            if (_local_8.@expandedWidth != undefined)
                            {
                                _local_9.expandedWidth = _local_8.@expandedWidth;
                            }
                            if (_local_8.@expandedHeight != undefined)
                            {
                                _local_9.expandedHeight = _local_8.@expandedHeight;
                            }
                            _local_9.scale = _local_8.@scalable;
                            _local_9.maintainAspectRatio = _local_8.@maintainAspectRatio;
                            if (_local_8.AdParameters != undefined)
                            {
                                _local_9.adParameters = _local_8.AdParameters;
                            }
                            if (_local_8.@minSuggestedDuration != undefined)
                            {
                                if (Timestamp.validate(_local_8.@minSuggestedDuration))
                                {
                                    _local_9.recommendedMinDuration = Timestamp.timestampToSeconds(_local_8.@minSuggestedDuration);
                                }
                                else
                                {
                                    _local_9.recommendedMinDuration = _local_8.@minSuggestedDuration;
                                }
                            }
                            if ((_local_9 is _Str_6437))
                            {
                                if (_local_8.IFrameResource != undefined)
                                {
                                    _local_9.url = new NetworkResource(null, _local_8.IFrameResource.text());
                                }
                            }
                            if ((_local_9 is _Str_6389))
                            {
                                if (_local_8.HTMLResource != undefined)
                                {
                                    _local_9.codeBlock = _local_8.HTMLResource.text();
                                }
                            }
                            if ((_local_9 is _Str_4867))
                            {
                                if (_local_8.HTMLResource != undefined)
                                {
                                    _local_9.codeBlock = _local_8.HTMLResource.text();
                                }
                                else
                                {
                                    if (_local_8.StaticResource != undefined)
                                    {
                                        _local_9.url = new NetworkResource(null, _local_8.StaticResource.text());
                                    }
                                }
                            }
                            else
                            {
                                if (_local_8.StaticResource != undefined)
                                {
                                    _local_9.url = new NetworkResource(null, _local_8.StaticResource.text());
                                }
                            }
                            if (_local_8.NonLinearClickThrough != undefined)
                            {
                                for each (_local_11 in _local_8.NonLinearClickThrough)
                                {
                                    if (!StringUtils.isEmpty(_local_11.text()))
                                    {
                                        _local_9._Str_7230(new NetworkResource(null, _local_11.text()));
                                    }
                                }
                            }
                            _local_2.push(_local_9);
                        }
                        else
                        {
                            if (_local_4[_local_5].name() == "TrackingEvents")
                            {
                                _local_12 = _local_4[_local_5].children();
                                _local_6 = new Array();
                                _local_13 = 0;
                                while (_local_13 < _local_12.length())
                                {
                                    _local_14 = _local_12[_local_13];
                                    _local_15 = new TrackingEvent(_local_14.@event);
                                    _local_16 = _local_14.children();
                                    _local_15._Str_9951(new NetworkResource(_local_12[_local_13].@event, _local_12[_local_13].text()));
                                    _local_6.push(_local_15);
                                    _local_13++;
                                }
                            }
                            else
                            {
                                if (_local_4[_local_5].name() == "AdParameters")
                                {
                                    _local_7 = _local_4[_local_5];
                                }
                            }
                        }
                        _local_5++;
                    }
                    if (((!(_local_6 == null)) || (!(_local_7 == null))))
                    {
                        if (_local_6 != null)
                        {
                        }
                        if (_local_7 != null)
                        {
                        }
                        for each (_local_17 in _local_2)
                        {
                            if (_local_6 != null)
                            {
                                _local_17.trackingEvents = this.clone(_local_6);
                            }
                            if (_local_7 != null)
                            {
                                _local_17.adParameters = _local_7;
                            }
                        }
                    }
                }
            }
            return _local_2;
        }

        protected function _Str_25848(k:XMLList):Array
        {
            var _local_3:XML;
            var _local_4:CompanionAd;
            var _local_5:XMLList;
            var _local_6:XML;
            var _local_7:int;
            var _local_8:XMLList;
            var _local_9:int;
            var _local_10:XML;
            var _local_11:TrackingEvent;
            var _local_12:XMLList;
            var _local_2:Array = new Array();
            if (k.length() > 0)
            {
                for each (_local_3 in k.children())
                {
                    _local_4 = new CompanionAd();
                    _local_4.isVAST2 = true;
                    _local_4.id = _local_3.@id;
                    _local_4.width = _local_3.@width;
                    _local_4.height = _local_3.@height;
                    _local_4.index = this._Str_17110(_local_4.width, _local_4.height);
                    if (_local_3.StaticResource != undefined)
                    {
                        _local_4.creativeType = _local_3.StaticResource.@creativeType;
                        _local_4.resourceType = "STATIC";
                        _local_4.url = new NetworkResource(null, _local_3.StaticResource.text());
                    }
                    else
                    {
                        if (_local_3.IFrameResource != undefined)
                        {
                            _local_4.creativeType = "STATIC";
                            _local_4.resourceType = "IFRAME";
                            _local_4.url = new NetworkResource(null, _local_3.IFrameResource.text());
                        }
                        else
                        {
                            if (_local_3.HTMLResource != undefined)
                            {
                                _local_4.creativeType = "TEXT";
                                _local_4.resourceType = "HTML";
                                _local_4.codeBlock = _local_3.HTMLResource.text();
                            }
                        }
                    }
                    if (_local_3.CompanionClickThrough != undefined)
                    {
                        _local_5 = _local_3.CompanionClickThrough;
                        _local_7 = 0;
                        while (_local_7 < _local_5.length())
                        {
                            _local_6 = _local_5[_local_7];
                            _local_4._Str_7230(new NetworkResource(_local_6.@id, _local_6.text()));
                            _local_7++;
                        }
                    }
                    if (_local_3.AltText != undefined)
                    {
                        _local_4.altText = _local_3.AltText.text();
                    }
                    if (_local_3.AdParameters != undefined)
                    {
                        _local_4.adParameters = _local_3.AdParameters.text();
                    }
                    if (_local_3.TrackingEvents != undefined)
                    {
                        _local_8 = _local_3.TrackingEvents.children();
                        _local_9 = 0;
                        while (_local_9 < _local_8.length())
                        {
                            _local_10 = _local_8[_local_9];
                            _local_11 = new TrackingEvent(_local_10.@event);
                            _local_12 = _local_10.children();
                            _local_11._Str_9951(new NetworkResource(_local_8[_local_9].@event, _local_8[_local_9].text()));
                            _local_4._Str_10620(_local_11);
                            _local_9++;
                        }
                    }
                    _local_2.push(_local_4);
                }
            }
            return _local_2;
        }

        protected function clone(k:Object):*
        {
            var _local_2:Array;
            var _local_3:*;
            var _local_4:ByteArray;
            if (k != null)
            {
                if ((k is Array))
                {
                    _local_2 = new Array();
                    for each (_local_3 in k)
                    {
                        _local_2.push(_local_3.clone());
                    }
                    return _local_2;
                }
                _local_4 = new ByteArray();
                _local_4.writeObject(k);
                _local_4.position = 0;
                return _local_4.readObject();
            }
            return null;
        }

        public function _Str_24138():VideoAd
        {
            if (_Str_2518 != null)
            {
                if (_Str_2518.length > 0)
                {
                    return _Str_2518[0];
                }
            }
            return null;
        }

        public function toString():String
        {
            var k:String;
            var _local_2:int;
            if (hasAds())
            {
                k = "[";
                _local_2 = 0;
                while (_local_2 < _Str_2518.length)
                {
                    k = (k + (_Str_2518[_local_2].toString() + ","));
                    _local_2++;
                }
                return k + "]";
            }
            return "VideoAdServingTemplate.toString(): No ads to print out";
        }
    }
}
