package org.openvideoads.vast.model
{
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.vast.server.request.wrapped._Str_6140;
    import org.openvideoads.vast.server.response.AdServerTemplate;
    import flash.events.Event;
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.util.StringUtils;
    import flash.events.*;

    public class WrappedVideoAdServingTemplateV2 extends VideoAdServingTemplate 
    {
        protected var _Str_5185:String = null;
        protected var _Str_8143:Object = null;
        protected var _Str_5787:VideoAdServingTemplate;
        protected var _id:String = null;
        protected var _Str_6606:String = null;
        protected var _Str_25531:Array;
        protected var _Str_3421:Array;
        protected var _Str_6810:Array;
        protected var _Str_13427:Array;

        public function WrappedVideoAdServingTemplateV2(k:int, _arg_2:String=null, _arg_3:XML=null, _arg_4:VideoAdServingTemplate=null)
        {
            this._Str_25531 = new Array();
            this._Str_3421 = new Array();
            this._Str_6810 = new Array();
            this._Str_13427 = new Array();
            super(_arg_4, null);
            this._Str_5787 = _arg_4;
            this._Str_8143 = _arg_2;
            if (_arg_3 != null)
            {
                this.initialise(k, _arg_3, _arg_2);
            }
        }

        protected function initialise(k:int, _arg_2:XML, _arg_3:String):void
        {
            var _local_4:AdServerConfig;
            this.id = _arg_2.adId;
            this.adSystem = _arg_2.AdSystem;
            if (_arg_2.VASTAdTagURI != undefined)
            {
                this._Str_6281 = _arg_2.VASTAdTagURI.text();
            }
            else
            {
                if (_arg_2.VASTAdTagURL != undefined)
                {
                    if (_arg_2.VASTAdTagURL.URL != undefined)
                    {
                        this._Str_6281 = _arg_2.VASTAdTagURL.URL.text();
                    }
                    else
                    {
                        this._Str_6281 = _arg_2.VASTAdTagURL.text();
                    }
                }
            }
            this._Str_13427 = parseInlineAd_V2(k, _arg_3, _arg_2);
            this._Str_23805();
            if (this._Str_17688())
            {
                _local_4 = null;
                if (this._Str_5787 != null)
                {
                    this._Str_5787._Str_15107(_Str_2995);
                    _local_4 = this._Str_5787._Str_18666();
                }
                load(new _Str_6140(this._Str_6281, _local_4));
            }
        }

        override public function hasAds(k:Boolean=false):Boolean
        {
            if (_Str_2518 == null)
            {
                return false;
            }
            return ((_Str_2518.length + this._Str_3421.length) + this._Str_6810.length) > 0;
        }

        override public function onTemplateLoaded(k:AdServerTemplate):void
        {
            _Str_2518 = k.getMergedAds();
            _Str_6919(k.uid);
        }

        override public function onTemplateLoadError(k:Event):void
        {
            this._Str_5787._Str_6067(uid, k);
        }

        override protected function templateLoaded(k:Event):void
        {
            _Str_6188 = _Str_3081.data;
            _Str_15022(_Str_6188);
            _Str_17582();
            _Str_6919(_Str_2995);
        }

        override protected function errorHandler(k:Event):void
        {
            this._Str_5787._Str_6067(uid, k);
        }

        override public function onAdCallStarted(k:AdServerRequest):void
        {
            this._Str_5787.onAdCallStarted(k);
        }

        override public function onAdCallFailover(k:AdServerRequest, _arg_2:AdServerRequest):void
        {
            this._Str_5787.onAdCallFailover(k, _arg_2);
        }

        override public function onAdCallComplete(k:AdServerRequest, _arg_2:Boolean):void
        {
            this._Str_5787.onAdCallComplete(k, _arg_2);
        }

        private function _Str_23712(k:Array):int
        {
            var _local_2:int;
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    if (k[_local_2] != null)
                    {
                        if (k[_local_2].isLinear())
                        {
                            return _local_2;
                        }
                    }
                    _local_2++;
                }
            }
            return -1;
        }

        private function _Str_25647(k:Array):int
        {
            var _local_2:int;
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    if (k[_local_2] != null)
                    {
                        if (k[_local_2].isNonLinear())
                        {
                            return _local_2;
                        }
                    }
                    _local_2++;
                }
            }
            return -1;
        }

        private function _Str_23548(k:Array):int
        {
            var _local_2:int;
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    if (k[_local_2] != null)
                    {
                        if (k[_local_2].isCompanionOnlyAd())
                        {
                            return _local_2;
                        }
                    }
                    _local_2++;
                }
            }
            return -1;
        }

        protected function _Str_23805():void
        {
            var k:int;
            if (_Str_2518 != null)
            {
                this._Str_3421 = new Array();
                this._Str_6810 = new Array();
                k = 0;
                while (k < _Str_2518.length)
                {
                    if (_Str_2518[k].isWrapperTemplateAd())
                    {
                        this._Str_3421.push(_Str_2518[k]);
                    }
                    else
                    {
                        this._Str_6810.push(_Str_2518[k]);
                    }
                    k++;
                }
                this._Str_3421 = this._Str_3421.reverse();
                this._Str_6810 = this._Str_6810.reverse();
            }
            _Str_2518 = new Array();
        }

        override public function getMergedAds():Array
        {
            var _local_3:int;
            var _local_4:VideoAd;
            var _local_5:int;
            var k:Array = new Array();
            if (this._Str_3421 != null)
            {
                _local_4 = null;
                _local_5 = 0;
                while (_local_5 < this._Str_3421.length)
                {
                    if (this._Str_3421[_local_5].isLinear())
                    {
                        _local_3 = this._Str_23712(_Str_2518);
                        if (_local_3 > -1)
                        {
                            _local_4 = this._Str_3421[_local_5].injectAllTrackingData(_Str_2518[_local_3]);
                            if ((((!(_local_4 == null)) && (VideoAd(_Str_2518[_local_3]).hasCompanionAds() == false)) && (VideoAd(this._Str_3421[_local_5]).hasCompanionAds())))
                            {
                                _local_4._Str_21998(VideoAd(this._Str_3421[_local_5]).companionAds);
                            }
                            k.push(_local_4);
                            _Str_2518[_local_3] = null;
                        }
                        else
                        {
                            k.push(this._Str_3421[_local_5]);
                        }
                    }
                    else
                    {
                        if (this._Str_3421[_local_5].isNonLinear())
                        {
                            _local_3 = this._Str_25647(_Str_2518);
                            if (_local_3 > -1)
                            {
                                _local_4 = this._Str_3421[_local_5].injectAllTrackingData(_Str_2518[_local_3]);
                                if ((((!(_local_4 == null)) && (VideoAd(_Str_2518[_local_3]).hasCompanionAds() == false)) && (VideoAd(this._Str_3421[_local_5]).hasCompanionAds())))
                                {
                                    _local_4._Str_21998(VideoAd(this._Str_3421[_local_5]).companionAds);
                                }
                                k.push(_local_4);
                                _Str_2518[_local_3] = null;
                            }
                            else
                            {
                                k.push(this._Str_3421[_local_5]);
                            }
                        }
                        else
                        {
                            if (VideoAd(this._Str_3421[_local_5]).isCompanionOnlyAd())
                            {
                                _local_3 = this._Str_23548(_Str_2518);
                                if (_local_3 > -1)
                                {
                                    k.push(this._Str_3421[_local_5].injectAllTrackingData(_Str_2518[_local_3]));
                                    _Str_2518[_local_3] = null;
                                }
                            }
                            else
                            {
                                k.push(this._Str_3421[_local_5]);
                            }
                        }
                    }
                    _local_5++;
                }
            }
            var _local_2:int;
            while (_local_2 < _Str_2518.length)
            {
                if (_Str_2518[_local_2] != null)
                {
                    if (this._Str_13427.length > 0)
                    {
                        _Str_2518[_local_2].addImpressions(this._Str_13427);
                    }
                    k.push(_Str_2518[_local_2]);
                }
                _local_2++;
            }
            if (this._Str_6810 != null)
            {
                k = k.concat(this._Str_6810);
            }
            return k;
        }

        public function set id(k:String):void
        {
            this._id = this.id;
        }

        public function get id():String
        {
            return this._id;
        }

        public function set adSystem(k:String):void
        {
            this._Str_6606 = k;
        }

        public function get adSystem():String
        {
            return this._Str_6606;
        }

        public function set _Str_6281(k:String):void
        {
            this._Str_5185 = k;
        }

        public function get _Str_6281():String
        {
            return this._Str_5185;
        }

        public function _Str_17688():Boolean
        {
            return (!(this._Str_5185 == null)) && (StringUtils.isEmpty(this._Str_5185) == false);
        }

        override protected function createVideoAd_V2(k:String, _arg_2:XML, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:String):VideoAd
        {
            return super.createVideoAd_V2(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
        }
    }
}
