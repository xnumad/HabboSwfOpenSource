package org.openvideoads.vast.config.groupings.analytics.google
{
    import org.openvideoads.base.Debuggable;
    import flash.display.DisplayObject;
    import org.openvideoads.vast.analytics._Str_2408;
    import org.openvideoads.util.StringUtils;

    public class GoogleAnalyticsTrackingGroup extends Debuggable 
    {
        protected static const _Str_17614:String = "UA-4011032-6";

        protected var _Str_4877:String = null;
        protected var _Str_6607:Boolean = true;
        protected var _Str_18609:Boolean = false;
        protected var _Str_17778:Boolean = true;
        protected var _Str_14609:Boolean = true;
        protected var _name:String = "No name";
        protected var _Str_3197:Object;
        protected var _Str_15769:Object = null;
        protected var _Str_21601:String = "";
        protected var _Str_3875:DisplayObject = null;

        public function GoogleAnalyticsTrackingGroup(k:String, _arg_2:Object=null, _arg_3:Boolean=false)
        {
            this._Str_3197 = {
                "impressions":{"enable":false},
                "adCalls":{"enable":false},
                "template":{"enable":false},
                "adSlot":{"enable":false},
                "progress":{"enable":false},
                "clicks":{"enable":false},
                "vpaid":{"enable":false}
            }
            super();
            if (k != null)
            {
                this._name = k;
            }
            if (_arg_2 != null)
            {
                this.initialise(_arg_2, _arg_3);
            }
            else
            {
                this._Str_20420();
            }
        }

        public function _Str_23924():void
        {
            this._Str_6607 = true;
        }

        public function _Str_22990():void
        {
            this._Str_6607 = false;
        }

        public function _Str_26429(k:String):void
        {
            this._Str_6607 = true;
            if (k == _Str_2408.ALL)
            {
                this._Str_23924();
            }
            else
            {
                this._Str_3197[k].enable = true;
            }
        }

        public function _Str_26224(k:String):void
        {
            if (k == _Str_2408.ALL)
            {
                this._Str_22990();
            }
            else
            {
                this._Str_3197[k].enable = false;
            }
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function get name():String
        {
            return this._name;
        }

        protected function _Str_8060(k:Object, _arg_2:Object, _arg_3:Boolean=false):void
        {
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_6:*;
            if (((!(k == null)) && (!(_arg_2 == null))))
            {
                _local_4 = false;
                _local_5 = false;
                for (_local_6 in k)
                {
                    if (_local_6 == "enable")
                    {
                        if ((k.enable is String))
                        {
                            _arg_2.enable = (k.enable.toUpperCase() == "TRUE");
                        }
                        else
                        {
                            _arg_2.enable = k.enable;
                        }
                        if (_arg_2.enable)
                        {
                            this._Str_6607 = true;
                        }
                        _local_4 = true;
                    }
                    else
                    {
                        _arg_2[_local_6] = k[_local_6];
                        _local_5 = true;
                    }
                }
                if ((((_arg_3) && (_local_5)) && (_local_4 == false)))
                {
                    _arg_2.enable = true;
                }
            }
        }

        protected function _Str_25826():void
        {
            var _local_2:*;
            var k:String = "";
            if (this._Str_15769 != null)
            {
                for (_local_2 in this._Str_15769)
                {
                    k = (k + ((("&" + _local_2) + "=") + this._Str_15769[_local_2]));
                }
            }
            this._Str_21601 = k;
        }

        public function initialise(k:Object, _arg_2:Boolean=false):void
        {
            if (k.useDefaultPaths != undefined)
            {
                this._Str_14609 = StringUtils._Str_2810(k.useDefaultPaths);
            }
            this._Str_20420();
            if (k.accountId != undefined)
            {
                this._Str_4877 = k.accountId;
            }
            if (k.enable != undefined)
            {
                if ((k.enable is String))
                {
                    this._Str_6607 = (k.enable.toUpperCase() == "TRUE");
                }
                else
                {
                    this._Str_6607 = k.enable;
                }
            }
            if (k.name != undefined)
            {
                this._name = k.name;
            }
            if (k.impressions != undefined)
            {
                this._Str_8060(k.impressions, this._Str_3197.impressions, _arg_2);
            }
            if (k.adCalls != undefined)
            {
                this._Str_8060(k.adCalls, this._Str_3197.adCalls, _arg_2);
            }
            if (k.template != undefined)
            {
                this._Str_8060(k.template, this._Str_3197.template, _arg_2);
            }
            if (k.adSlot != undefined)
            {
                this._Str_8060(k.adSlot, this._Str_3197.adSlot, _arg_2);
            }
            if (k.progress != undefined)
            {
                this._Str_8060(k.progress, this._Str_3197.progress, _arg_2);
            }
            if (k.vpaid != undefined)
            {
                this._Str_8060(k.vpaid, this._Str_3197.vpaid, _arg_2);
            }
            if (k.clicks != undefined)
            {
                this._Str_8060(k.clicks, this._Str_3197.clicks, _arg_2);
            }
            if (k.parameters != undefined)
            {
                this._Str_23880 = k.parameters;
            }
            if (k.displayObject != undefined)
            {
                this._Str_3875 = k.displayObject;
            }
            if (k.trackAdTags != undefined)
            {
                this._Str_18609 = StringUtils._Str_2810(k.trackAdTags);
            }
            if (k.addParamsToTrackingURL != undefined)
            {
                this._Str_17778 = StringUtils._Str_2810(k.addParamsToTrackingURL);
            }
            this._Str_23543();
        }

        protected function _Str_20420():void
        {
            if (this._Str_14609)
            {
                this._Str_3197 = {
                    "impressions":{
                        "enable":false,
                        "linear":"/ova/impression/default?ova_format=linear",
                        "nonLinear":"/ova/impression/default?ova_format=non-linear",
                        "companion":"/ova/impression/default?ova_format=companion"
                    },
                    "adCalls":{
                        "enable":false,
                        "fired":"/ova/ad-call/default?ova_action=fired",
                        "complete":"/ova/ad-call/default?ova_action=complete",
                        "failover":"/ova/ad-call/default?ova_action=failover",
                        "error":"/ova/ad-call/default?ova_action=error",
                        "timeout":"/ova/ad-call/default?ova_action=timeout",
                        "deferred":"/ova/ad-call/default?ova_action=deferred"
                    },
                    "template":{
                        "enable":false,
                        "loaded":"/ova/template/default?ova_action=loaded",
                        "error":"/ova/template/default?ova_action=error",
                        "timeout":"/ova/template/default?ova_action=timeout",
                        "deferred":"/ova/template/default?ova_action=deferred"
                    },
                    "adSlot":{
                        "enable":false,
                        "loaded":"/ova/ad-slot/default?ova_action=loaded",
                        "error":"/ova/ad-slot/default?ova_action=error",
                        "timeout":"/ova/ad-slot/default?ova_action=timeout",
                        "deferred":"/ova/ad-slot/default?ova_action=deferred"
                    },
                    "progress":{
                        "enable":false,
                        "start":"/ova/progress/default?ova_action=start",
                        "stop":"/ova/progress/default?ova_action=stop",
                        "firstQuartile":"/ova/progress/default?ova_action=firstQuartile",
                        "midpoint":"/ova/progress/default?ova_action=midpoint",
                        "thirdQuartile":"/ova/progress/default?ova_action=thirdQuartile",
                        "complete":"/ova/progress/default?ova_action=complete",
                        "pause":"/ova/progress/default?ova_action=pause",
                        "resume":"/ova/progress/default?ova_action=resume",
                        "fullscreen":"/ova/progress/default?ova_action=fullscreen",
                        "mute":"/ova/progress/default?ova_action=mute",
                        "unmute":"/ova/progress/default?ova_action=unmute",
                        "expand":"/ova/progress/default?ova_action=expand",
                        "collapse":"/ova/progress/default?ova_action=collapse",
                        "userAcceptInvitation":"/ova/progress/default?ova_action=userAcceptInvitation",
                        "close":"/ova/progress/default?ova_action=close"
                    },
                    "clicks":{
                        "enable":false,
                        "linear":"/ova/clicks/default?ova_action=linear",
                        "nonLinear":"/ova/clicks/default?ova_action=nonLinear",
                        "vpaid":"/ova/clicks/default?ova_action=vpaid"
                    },
                    "vpaid":{
                        "enable":false,
                        "loaded":"/ova/vpaid/default?ova_action=loaded",
                        "started":"/ova/vpaid/default?ova_action=started",
                        "stopped":"/ova/vpaid/default?ova_action=stopped",
                        "linearChange":"/ova/vpaid/default?ova_action=linearChange",
                        "expandedChange":"/ova/vpaid/default?ova_action=expandedChange",
                        "remainingTimeChange":"/ova/vpaid/default?ova_action=remainingTimeChange",
                        "volumeChange":"/ova/vpaid/default?ova_action=volumeChange",
                        "videoStart":"/ova/vpaid/default?ova_action=videoStart",
                        "videoFirstQuartile":"/ova/vpaid/default?ova_action=videoFirstQuartile",
                        "videoMidpoint":"/ova/vpaid/default?ova_action=videoMidpoint",
                        "videoThirdQuartile":"/ova/vpaid/default?ova_action=videoThirdQuartile",
                        "videoComplete":"/ova/vpaid/default?ova_action=videoComplete",
                        "userAcceptInvitation":"/ova/vpaid/default?ova_action=userAcceptInvitation",
                        "userClose":"/ova/vpaid/default?ova_action=userClose",
                        "paused":"/ova/vpaid/default?ova_action=paused",
                        "playing":"/ova/vpaid/default?ova_action=playing",
                        "error":"/ova/vpaid/default?ova_action=error"
                    }
                }
            }
            else
            {
                this._Str_3197 = {
                    "impressions":{"enable":false},
                    "adCalls":{"enable":false},
                    "template":{"enable":false},
                    "adSlot":{"enable":false},
                    "progress":{"enable":false},
                    "clicks":{"enable":false},
                    "vpaid":{"enable":false}
                }
            }
        }

        public function update(k:Object):void
        {
            this.initialise(k);
        }

        public function _Str_23543():void
        {
        }

        public function set _Str_23880(k:Object):void
        {
            this._Str_15769 = k;
            this._Str_25826();
        }

        protected function _Str_23864():String
        {
            return this._Str_21601;
        }

        public function _Str_25968():Boolean
        {
            return !(this._Str_4877 == null);
        }

        public function set accountId(k:String):void
        {
            this._Str_4877 = k;
        }

        public function get accountId():String
        {
            if (this._Str_4877 == null)
            {
                return _Str_17614;
            }
            return this._Str_4877;
        }

        public function _Str_25976(k:String, _arg_2:String):String
        {
            if (this._Str_3197.hasOwnProperty(k))
            {
                if (this._Str_3197[k].hasOwnProperty(_arg_2))
                {
                    return this._Str_3197[k][_arg_2] + this._Str_23864();
                }
            }
            return null;
        }

        public function set trackingEnabled(k:Boolean):void
        {
            this._Str_6607 = k;
        }

        public function get trackingEnabled():Boolean
        {
            return this._Str_6607;
        }

        public function _Str_26334(k:String):Boolean
        {
            if (this._Str_3197.hasOwnProperty(k))
            {
                if (this._Str_3197[k].hasOwnProperty("enable"))
                {
                    return (this.trackingEnabled) && (this._Str_3197[k].enable);
                }
            }
            return false;
        }

        public function _Str_26035():Boolean
        {
            return (this.trackingEnabled) && (this._Str_3197.adCalls.enable);
        }

        public function _Str_26382():Boolean
        {
            return (this.trackingEnabled) && (this._Str_3197.template.enable);
        }

        public function _Str_26031():Boolean
        {
            return (this.trackingEnabled) && (this._Str_3197.adSlot.enable);
        }

        public function _Str_25948():Boolean
        {
            return (this.trackingEnabled) && (this._Str_3197.progress.enable);
        }

        public function _Str_26345():Boolean
        {
            return (this.trackingEnabled) && (this._Str_3197.impressions.enable);
        }

        public function _Str_26343():Boolean
        {
            return (this.trackingEnabled) && (this._Str_3197.vpaid.enable);
        }

        public function _Str_26381():Boolean
        {
            return (this.trackingEnabled) && (this._Str_3197.clicks.enable);
        }

        public function set displayObject(k:DisplayObject):void
        {
            this._Str_3875 = k;
        }

        public function get displayObject():DisplayObject
        {
            return this._Str_3875;
        }

        public function set trackAdTags(k:Boolean):void
        {
            this._Str_18609 = k;
        }

        public function get trackAdTags():Boolean
        {
            return this._Str_18609;
        }

        public function set addParamsToTrackingURL(k:Boolean):void
        {
            this._Str_17778 = k;
        }

        public function get addParamsToTrackingURL():Boolean
        {
            return this._Str_17778;
        }

        public function set useDefaultPaths(k:Boolean):void
        {
            this._Str_14609 = k;
        }

        public function get useDefaultPaths():Boolean
        {
            return this._Str_14609;
        }
    }
}
