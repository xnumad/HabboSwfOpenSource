package org.openvideoads.vast.config.groupings
{
    public class VPAIDConfig 
    {
        public static const _Str_22107:String = "reserved-fullscreen-black-no-close-button-non-clickable";
        public static const _Str_21227:String = "reserved-fullscreen-black-no-close-button-non-clickable-minimize-rules";
        public static const _Str_20010:String = "reserved-fullscreen-transparent-no-close-button-non-clickable";
        public static const _Str_20698:String = "reserved-fullscreen-black-no-close-button-non-clickable-with-cb-height";
        public static const _Str_19080:String = "reserved-fullscreen-transparent-no-close-button-non-clickable-bottom-margin-adjusted";

        protected var _Str_20820:Boolean = false;
        protected var _Str_19204:String = null;
        protected var _Str_20807:String = "http://lp.longtailvideo.com/5/ova/blank.mp4";
        protected var _Str_23851:String = "reserved-fullscreen-black-no-close-button-non-clickable";
        protected var _Str_24504:String = "reserved-fullscreen-black-no-close-button-non-clickable-with-cb-height";
        protected var _Str_23539:String = "reserved-fullscreen-transparent-no-close-button-non-clickable";
        protected var _Str_25928:String = "reserved-fullscreen-transparent-no-close-button-non-clickable-bottom-margin-adjusted";
        protected var _Str_12645:String = null;
        protected var _Str_15285:String = null;
        protected var _Str_19854:int = 90;
        protected var _Str_21114:Boolean = false;
        protected var _Str_21288:Boolean = true;
        protected var _Str_21436:Boolean = true;
        protected var _Str_21529:Boolean = false;
        protected var _Str_19608:Boolean = false;
        protected var _Str_21663:Boolean = false;
        protected var _Str_20815:String = null;

        public function VPAIDConfig(k:Object=null)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object):void
        {
            var _local_2:RegExp;
            if (k.supplyReferrer != undefined)
            {
                if ((k.supplyReferrer is String))
                {
                    this.supplyReferrer = (k.supplyReferrer.toUpperCase() == "TRUE");
                }
                else
                {
                    this.supplyReferrer = k.supplyReferrer;
                }
            }
            if (k.enableLinearScaling != undefined)
            {
                if ((k.enableLinearScaling is String))
                {
                    this.enableLinearScaling = (k.enableLinearScaling.toUpperCase() == "TRUE");
                }
                else
                {
                    this.enableLinearScaling = k.enableLinearScaling;
                }
            }
            if (k.enableNonLinearScaling != undefined)
            {
                if ((k.enableNonLinearScaling is String))
                {
                    this.enableNonLinearScaling = (k.enableNonLinearScaling.toUpperCase() == "TRUE");
                }
                else
                {
                    this.enableNonLinearScaling = k.enableNonLinearScaling;
                }
            }
            if (k.referrer != undefined)
            {
                this.referrer = k.referrer;
            }
            if (k.holdingClipUrl != undefined)
            {
                this.holdingClipUrl = k.holdingClipUrl;
            }
            if (k.linearRegion != undefined)
            {
                this.linearRegion = k.linearRegion;
            }
            if (k.nonLinearRegion != undefined)
            {
                this.nonLinearRegion = k.nonLinearRegion;
            }
            if (k.terminateOnLogMessage != undefined)
            {
                if (k.terminateOnLogMessage != null)
                {
                    _local_2 = new RegExp("__single-quote__", "g");
                    k.terminateOnLogMessage = k.terminateOnLogMessage.replace(_local_2, "'");
                }
                this.terminateOnLogMessage = k.terminateOnLogMessage;
            }
            if (k.enableMaxDurationTimeout != undefined)
            {
                if ((k.enableMaxDurationTimeout is String))
                {
                    this.enableMaxDurationTimeout = (k.enableMaxDurationTimeout.toUpperCase() == "TRUE");
                }
                else
                {
                    this.enableMaxDurationTimeout = k.enableMaxDurationTimeout;
                }
            }
            if (k.maxDurationTimeout != undefined)
            {
                if ((k.maxDurationTimeout is String))
                {
                    this.maxDurationTimeout = int(k.maxDurationTimeout);
                }
                else
                {
                    this.maxDurationTimeout = k.maxDurationTimeout;
                }
            }
            if (k.pauseOnExpand != undefined)
            {
                if ((k.pauseOnExpand is String))
                {
                    this.pauseOnExpand = (k.pauseOnExpand.toUpperCase() == "TRUE");
                }
                else
                {
                    this.pauseOnExpand = k.pauseOnExpand;
                }
            }
            if (k.resumeOnCollapse != undefined)
            {
                if ((k.resumeOnCollapse is String))
                {
                    this.resumeOnCollapse = (k.resumeOnCollapse.toUpperCase() == "TRUE");
                }
                else
                {
                    this.resumeOnCollapse = k.resumeOnCollapse;
                }
            }
            if (k.testing != undefined)
            {
                if ((k.testing is String))
                {
                    this.testing = (k.testing.toUpperCase() == "TRUE");
                }
                else
                {
                    this.testing = k.testing;
                }
            }
        }

        public function set supplyReferrer(k:Boolean):void
        {
            this._Str_20820 = k;
        }

        public function get supplyReferrer():Boolean
        {
            return this._Str_20820;
        }

        public function set referrer(k:String):void
        {
            this._Str_19204 = k;
        }

        public function get referrer():String
        {
            return this._Str_19204;
        }

        public function set pauseOnExpand(k:Boolean):void
        {
            this._Str_21529 = k;
        }

        public function get pauseOnExpand():Boolean
        {
            return this._Str_21529;
        }

        public function set resumeOnCollapse(k:Boolean):void
        {
            this._Str_19608 = k;
        }

        public function get resumeOnCollapse():Boolean
        {
            return this._Str_19608;
        }

        public function get terminateOnLogMessage():String
        {
            return this._Str_20815;
        }

        public function set terminateOnLogMessage(k:String):void
        {
            this._Str_20815 = k;
        }

        public function set enableLinearScaling(k:Boolean):void
        {
            this._Str_21288 = k;
        }

        public function get enableLinearScaling():Boolean
        {
            return this._Str_21288;
        }

        public function set enableNonLinearScaling(k:Boolean):void
        {
            this._Str_21436 = k;
        }

        public function get enableNonLinearScaling():Boolean
        {
            return this._Str_21436;
        }

        public function set holdingClipUrl(k:String):void
        {
            this._Str_20807 = k;
        }

        public function get holdingClipUrl():String
        {
            return this._Str_20807;
        }

        public function set testing(k:Boolean):void
        {
            this._Str_21663 = k;
        }

        public function get testing():Boolean
        {
            return this._Str_21663;
        }

        public function _Str_26193():Boolean
        {
            return !(this._Str_12645 == null);
        }

        public function set linearRegion(k:String):void
        {
            this._Str_12645 = k;
        }

        public function getLinearRegion(k:Boolean):String
        {
            if (this._Str_12645 != null)
            {
                return this._Str_12645;
            }
            if (k)
            {
                return this._Str_23851;
            }
            return this._Str_24504;
        }

        public function set nonLinearRegion(k:String):void
        {
            this._Str_15285 = k;
        }

        public function get nonLinearRegion():String
        {
            if (this._Str_15285 != null)
            {
                return this._Str_15285;
            }
            return this._Str_23539;
        }

        public function _Str_26400():Boolean
        {
            return !(this._Str_15285 == null);
        }

        public function set maxDurationTimeout(k:int):void
        {
            this._Str_19854 = k;
        }

        public function get maxDurationTimeout():int
        {
            return this._Str_19854;
        }

        public function set enableMaxDurationTimeout(k:Boolean):void
        {
            this._Str_21114 = k;
        }

        public function get enableMaxDurationTimeout():Boolean
        {
            return this._Str_21114;
        }
    }
}
