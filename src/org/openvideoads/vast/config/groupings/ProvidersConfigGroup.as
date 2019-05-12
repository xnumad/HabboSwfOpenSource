package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;

    public class ProvidersConfigGroup extends Debuggable 
    {
        protected var _Str_16603:String = "http";
        protected var _Str_21342:String = null;
        protected var _Str_17754:String = "rtmp";
        protected var _Str_21726:String = null;
        protected var _Str_26468:Boolean = false;
        protected var _Str_21699:Boolean = false;

        public function ProvidersConfigGroup(k:Object=null)
        {
            if (k != null)
            {
                if (k.http != undefined)
                {
                    this.httpProvider = k.http;
                }
                if (k.rtmp != undefined)
                {
                    this.rtmpProvider = k.rtmp;
                }
                if (k.enforceSettingSubscribeRTMP != undefined)
                {
                    if ((k.enforceSettingSubscribeRTMP is String))
                    {
                        this.enforceSettingSubscribeRTMP = ((k.enforceSettingSubscribeRTMP.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.enforceSettingSubscribeRTMP = k.enforceSettingSubscribeRTMP;
                    }
                }
                if (k.rtmpSubscribe != undefined)
                {
                    if ((k.rtmpSubscribe is String))
                    {
                        this.rtmpSubscribe = ((k.rtmpSubscribe.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.rtmpSubscribe = k.rtmpSubscribe;
                    }
                }
            }
        }

        public function getProvider(k:String):String
        {
            switch (k.toUpperCase())
            {
                case "RTMP":
                    return this.rtmpProvider;
                case "HTTP":
                    return this.httpProvider;
            }
            return null;
        }

        public function _Str_21970(k:String):String
        {
            switch (k.toUpperCase())
            {
                case "RTMP":
                    return this._Str_10294;
                case "HTTP":
                    return this._Str_10463;
            }
            return null;
        }

        public function set httpProvider(k:*):void
        {
            if ((k is String))
            {
                this._Str_16603 = k;
            }
            else
            {
                if (k.type != undefined)
                {
                    this._Str_16603 = k.type;
                    if (k.streamer != undefined)
                    {
                        this._Str_10463 = k.streamer;
                    }
                }
            }
        }

        public function get httpProvider():String
        {
            return this._Str_16603;
        }

        public function set rtmpProvider(k:*):void
        {
            if ((k is String))
            {
                this._Str_17754 = k;
            }
            else
            {
                if (k.type != undefined)
                {
                    this._Str_17754 = k.type;
                    if (k.streamer != undefined)
                    {
                        this._Str_10294 = k.streamer;
                    }
                }
            }
        }

        public function get rtmpProvider():String
        {
            return this._Str_17754;
        }

        public function set _Str_10463(k:String):void
        {
            this._Str_21342 = k;
        }

        public function get _Str_10463():String
        {
            return this._Str_21342;
        }

        public function set _Str_10294(k:String):void
        {
            this._Str_21726 = k;
        }

        public function get _Str_10294():String
        {
            return this._Str_21726;
        }

        public function set rtmpSubscribe(k:Boolean):void
        {
            this._Str_26468 = this._Str_26468;
        }

        public function get rtmpSubscribe():Boolean
        {
            return this._Str_26468;
        }

        public function set enforceSettingSubscribeRTMP(k:Boolean):void
        {
            this._Str_21699 = k;
        }

        public function get enforceSettingSubscribeRTMP():Boolean
        {
            return this._Str_21699;
        }
    }
}
