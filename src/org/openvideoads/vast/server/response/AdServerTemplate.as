package org.openvideoads.vast.server.response
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.TransformingLoader;
    import org.openvideoads.vast.server.request.AdServerRequest;
    import org.openvideoads.vast.server.config.AdServerConfig;
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.util.TimedTransformingLoader;
    import flash.events.Event;
    import flash.events.ErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.events.IOErrorEvent;
    import org.openvideoads.events._Str_5692;
    import flash.net.URLRequest;
    import org.openvideoads.vast.analytics._Str_2408;
    import org.openvideoads.vast.model.VideoAd;
    import flash.events.*;

    public class AdServerTemplate extends Debuggable 
    {
        protected var _Str_17167:Boolean = false;
        protected var _Str_5528:Array = null;
        protected var _Str_2459:_Str_3802 = null;
        protected var _Str_6188:String = "";
        protected var _Str_2518:Array;
        protected var _Str_8445:Boolean = false;
        protected var _Str_3081:TransformingLoader = null;
        protected var _Str_6552:Array;
        protected var _Str_3439:AdServerRequest = null;
        protected var _Str_10889:Boolean = false;
        protected var _Str_3507:AdServerRequest = null;
        protected var _Str_5101:Boolean = false;

        public function AdServerTemplate(k:_Str_3802=null, _arg_2:AdServerRequest=null, _arg_3:Boolean=false, _arg_4:Array=null)
        {
            this._Str_2518 = new Array();
            this._Str_6552 = new Array();
            super();
            this._Str_17167 = _arg_3;
            this._Str_5528 = _arg_4;
            if (k != null)
            {
                this._Str_2459 = k;
            }
            if (_arg_2 != null)
            {
                this.load(_arg_2);
            }
        }

        public function load(k:AdServerRequest, _arg_2:Boolean=false):void
        {
        }

        public function unload():void
        {
            if (this._Str_3081 != null)
            {
                this._Str_3081.close();
            }
        }

        public function _Str_24781():void
        {
            this._Str_2518 = new Array();
        }

        public function set isMaster(k:Boolean):void
        {
            this._Str_10889 = k;
        }

        public function get isMaster():Boolean
        {
            return this._Str_10889;
        }

        public function set _Str_17208(k:AdServerRequest):void
        {
            this._Str_3439 = k;
            if (this._Str_3439 != null)
            {
                this._Str_5101 = this._Str_3439.forceImpressionServing();
            }
        }

        public function get _Str_17208():AdServerRequest
        {
            return this._Str_3439;
        }

        protected function _Str_5664():AdServerConfig
        {
            if (this._Str_3439 != null)
            {
                return this._Str_3439.config;
            }
            return null;
        }

        protected function _Str_12713(k:String):Boolean
        {
            if (this._Str_3439 != null)
            {
                if (this._Str_3439.config != null)
                {
                    return this._Str_3439.config.isAcceptedLinearAdMimeType(k);
                }
            }
            return true;
        }

        protected function _Str_26123():Array
        {
            if (this._Str_3439 != null)
            {
                if (this._Str_3439.config != null)
                {
                    return this._Str_3439.config.acceptedLinearAdMimeTypes;
                }
            }
            return null;
        }

        public function get forceImpressionServing():Boolean
        {
            return this._Str_5101;
        }

        protected function _Str_14997():Boolean
        {
            if (this._Str_3439 != null)
            {
                return this._Str_3439._Str_14997();
            }
            return true;
        }

        protected function _Str_13492():Boolean
        {
            return this._Str_17167;
        }

        protected function getReplacementAdId(k:String):String
        {
            return null;
        }

        protected function _Str_23772(k:Array):Array
        {
            var _local_2:int;
            var _local_3:String;
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    _local_3 = this.getReplacementAdId(k[_local_2].adType);
                    if (_local_3 != null)
                    {
                        k[_local_2].id = _local_3;
                    }
                    _local_2++;
                }
            }
            return k;
        }

        protected function _Str_23044():void
        {
            var k:Object;
            if (this._Str_5528 != null)
            {
                for each (k in this._Str_5528)
                {
                    k.assigned = false;
                }
            }
        }

        public function _Str_18666():AdServerConfig
        {
            if (this._Str_3439 != null)
            {
                return this._Str_3439.config;
            }
            return null;
        }

        public function _Str_15107(k:String):void
        {
            this._Str_6552.push(k);
        }

        public function _Str_12680(k:String):void
        {
            var _local_2:int = this._Str_6552.indexOf(k);
            if (((_local_2 > -1) && (_local_2 < this._Str_6552.length)))
            {
                this._Str_6552[_local_2] = null;
            }
        }

        protected function _Str_15072():Boolean
        {
            var k:int;
            if (this._Str_6552.length > 0)
            {
                k = 0;
                while (k < this._Str_6552.length)
                {
                    if (this._Str_6552[k] != null)
                    {
                        return false;
                    }
                    k++;
                }
            }
            return true;
        }

        protected function loadTemplateData(k:AdServerRequest):void
        {
            var _local_2:String;
            if (k != null)
            {
                this._Str_3507 = k;
                _local_2 = this._Str_3507.formRequest();
                if (StringUtils.isEmpty(_local_2) == false)
                {
                    if (this._Str_2459 != null)
                    {
                        this._Str_2459.onAdCallStarted(k);
                    }
                    this._Str_3081 = new TimedTransformingLoader((k.timeoutInSeconds * 1000));
                    if (k._Str_22402())
                    {
                        this._Str_3081.transformers = k.config.transformers;
                    }
                    this._Str_3081.addEventListener(Event.COMPLETE, this.templateLoaded);
                    this._Str_3081.addEventListener(ErrorEvent.ERROR, this.errorHandler);
                    this._Str_3081.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.errorHandler);
                    this._Str_3081.addEventListener(IOErrorEvent.IO_ERROR, this.errorHandler);
                    this._Str_3081.addEventListener(_Str_5692._Str_5406, this.timeoutHandler);
                    this._Str_3081.load(new URLRequest(_local_2));
                    if (this._Str_2459 != null)
                    {
                        if (this._Str_2459.analyticsProcessor != null)
                        {
                            this._Str_2459.analyticsProcessor._Str_7633(_Str_2408.FIRED, this._Str_3507, this._Str_3507.isWrapped());
                        }
                    }
                }
                else
                {
                    this.errorHandler(new Event("Empty ad tag - ignored"));
                }
            }
        }

        protected function _Str_17582():void
        {
            if (this._Str_2459 != null)
            {
                if (((!(this._Str_2459.analyticsProcessor == null)) && (!(this._Str_3507 == null))))
                {
                    this._Str_2459.analyticsProcessor._Str_7633(_Str_2408.COMPLETE, this._Str_3507, this._Str_3507.isWrapped());
                }
            }
        }

        protected function templateLoaded(k:Event):void
        {
            this._Str_17582();
            this._Str_6919(_Str_2995);
        }

        protected function errorHandler(k:Event):void
        {
            this._Str_6067(_Str_2995, k);
        }

        protected function timeoutHandler(k:Event):void
        {
            this._Str_8677(_Str_2995, k);
        }

        public function _Str_22097():Boolean
        {
            if (this._Str_3439 != null)
            {
                return this._Str_3439._Str_19881();
            }
            return false;
        }

        protected function _Str_12764():Boolean
        {
            return ((this.isMaster) && (this.hasAds() == false)) && (this._Str_22097());
        }

        public function _Str_13744():void
        {
            if (this._Str_3081 != null)
            {
                try
                {
                    this._Str_3081.close();
                    this._Str_3081 = null;
                }
                catch(e:Error)
                {
                }
            }
        }

        public function _Str_6919(k:String):void
        {
            if (this._Str_2459 != null)
            {
                this._Str_2459.onAdCallComplete(this._Str_3507, this.hasAds());
            }
            this._Str_13744();
            this._Str_12680(k);
            if (this._Str_15072())
            {
                if (this._Str_12764())
                {
                    this._Str_10465();
                }
                else
                {
                    if (this._Str_2459 != null)
                    {
                        this._Str_2459.onTemplateLoaded(this);
                    }
                }
            }
        }

        public function _Str_6067(k:String, _arg_2:Event):void
        {
            if (this._Str_2459 != null)
            {
                this._Str_2459.onAdCallComplete(this._Str_3507, false);
                if (((!(this._Str_2459.analyticsProcessor == null)) && (!(this._Str_3507 == null))))
                {
                    this._Str_2459.analyticsProcessor._Str_7633(_Str_2408.ERROR, this._Str_3507, this._Str_3507.isWrapped(), _arg_2.toString());
                }
            }
            this._Str_13744();
            this._Str_12680(k);
            if (this._Str_15072())
            {
                if (this._Str_12764())
                {
                    this._Str_10465();
                }
                else
                {
                    if (this._Str_2459 != null)
                    {
                        this._Str_2459.onTemplateLoadError(_arg_2);
                    }
                }
            }
        }

        public function _Str_8677(k:String, _arg_2:Event):void
        {
            if (this._Str_2459 != null)
            {
                this._Str_2459.onAdCallComplete(this._Str_3507, false);
                if (((!(this._Str_2459.analyticsProcessor == null)) && (!(this._Str_3507 == null))))
                {
                    this._Str_2459.analyticsProcessor._Str_7633(_Str_2408.TIMEOUT, this._Str_3507, this._Str_3507.isWrapped());
                }
            }
            this._Str_13744();
            this._Str_12680(k);
            if (this._Str_15072())
            {
                if (this._Str_12764())
                {
                    this._Str_10465();
                }
                else
                {
                    if (this._Str_2459 != null)
                    {
                        this._Str_2459._Str_5807(_arg_2);
                    }
                }
            }
        }

        public function _Str_16343(k:String, _arg_2:Event):void
        {
            if (this._Str_2459 != null)
            {
                if (((!(this._Str_2459.analyticsProcessor == null)) && (!(this._Str_3507 == null))))
                {
                    this._Str_2459.analyticsProcessor._Str_7633(_Str_2408.DEFERRED, this._Str_3507, this._Str_3507.isWrapped());
                }
            }
            this._Str_13744();
            this._Str_12680(k);
            if (this._Str_15072())
            {
                if (this._Str_12764())
                {
                    this._Str_10465();
                }
                else
                {
                    if (this._Str_2459 != null)
                    {
                        this._Str_2459._Str_5916(_arg_2);
                    }
                }
            }
        }

        public function _Str_10465():void
        {
            var k:AdServerRequest = this._Str_3439._Str_25223();
            if (k != null)
            {
                this._Str_2518 = new Array();
                if (this._Str_2459 != null)
                {
                    this._Str_2459.onAdCallFailover(this._Str_3439, k);
                    if (((!(this._Str_2459.analyticsProcessor == null)) && (!(this._Str_3507 == null))))
                    {
                        this._Str_2459.analyticsProcessor._Str_7633(_Str_2408.FAILOVER, k, k.isWrapped());
                    }
                }
                this._Str_17167 = k._Str_20400;
                this._Str_23044();
                this.load(k, true);
            }
            else
            {
                this._Str_6067(_Str_2995, new Event("Unexpeced error - No ad server request to failover to - signaling error"));
            }
        }

        public function set _Str_13562(k:Boolean):void
        {
            this._Str_8445 = k;
        }

        public function get _Str_13562():Boolean
        {
            return this._Str_8445;
        }

        public function set ads(k:Array):void
        {
            this._Str_2518 = k;
        }

        public function _Str_24660():int
        {
            if (this._Str_2518 != null)
            {
                return this._Str_2518.length;
            }
            return 0;
        }

        public function get ads():Array
        {
            return this._Str_2518;
        }

        public function hasAds(k:Boolean=false):Boolean
        {
            var _local_2:VideoAd;
            if (this._Str_2518 == null)
            {
                return false;
            }
            for each (_local_2 in this._Str_2518)
            {
                if (_local_2.hasAds(k))
                {
                    return true;
                }
            }
            return false;
        }

        public function _Str_18406():String
        {
            return this._Str_6188;
        }

        public function _Str_26330():String
        {
            var k:XML = new XML(this._Str_18406());
            var _local_2:RegExp = /\n/g;
            var _local_3:String = k.toXMLString().replace(_local_2, "\\n");
            return _local_3;
        }

        public function getMergedAds():Array
        {
            return this._Str_2518;
        }

        protected function _Str_19800(k:Array):Array
        {
            var _local_2:Array;
            var _local_3:int;
            var _local_4:int;
            if (this._Str_5101 == false)
            {
                if (k != null)
                {
                    _local_2 = new Array();
                    _local_3 = 0;
                    _local_4 = 0;
                    while (_local_4 < k.length)
                    {
                        if (VideoAd(k[_local_4]).isEmpty() == false)
                        {
                            _local_2.push(k[_local_4]);
                        }
                        else
                        {
                            _local_3++;
                        }
                        _local_4++;
                    }
                    return _local_2;
                }
            }
            return k;
        }

        public function _Str_11882(k:AdServerTemplate, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            if (k.forceImpressionServing)
            {
                this._Str_5101 = true;
            }
            else
            {
                this._Str_5101 = false;
            }
            if (k.hasAds(this._Str_5101))
            {
                if (_arg_2)
                {
                    this._Str_2518 = this._Str_2518.concat(this._Str_23772(this._Str_19800(((_arg_3) ? k.getMergedAds() : k.ads))));
                }
                else
                {
                    this._Str_2518 = this._Str_2518.concat(this._Str_19800(((_arg_3) ? k.getMergedAds() : k.ads)));
                }
            }
            this._Str_6188 = (this._Str_6188 + k._Str_18406());
        }

        public function filterLinearAdMediaFileByMimeType(k:Array):void
        {
        }

        public function _Str_22289(k:String):VideoAd
        {
            var _local_2:int;
            if (this._Str_2518 != null)
            {
                _local_2 = 0;
                while (_local_2 < this._Str_2518.length)
                {
                    if (this._Str_2518[_local_2].id == k)
                    {
                        return this._Str_2518[_local_2];
                    }
                    _local_2++;
                }
            }
            return null;
        }

        public function _Str_22948(k:int):VideoAd
        {
            var _local_2:int;
            if (this._Str_2518 != null)
            {
                if (this._Str_2518.length > 0)
                {
                    _local_2 = k;
                    while (_local_2 < this._Str_2518.length)
                    {
                        if (((VideoAd(this._Str_2518[_local_2]).isEmpty() == false) && (VideoAd(this._Str_2518[_local_2]).isCompanionOnlyAd() == false)))
                        {
                            return this._Str_2518[_local_2];
                        }
                        _local_2++;
                    }
                }
            }
            return null;
        }

        public function _Str_3462(k:VideoAd):void
        {
            this._Str_2518.push(k);
        }
    }
}
