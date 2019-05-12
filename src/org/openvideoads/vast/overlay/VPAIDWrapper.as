package org.openvideoads.vast.overlay
{
    import flash.events.EventDispatcher;
    import org.openvideoads.vpaid._Str_5844;
    import flash.utils.describeType;
    import flash.utils.getQualifiedClassName;
    import flash.events.Event;
    import flash.utils.*;

    public class VPAIDWrapper extends EventDispatcher implements _Str_5844 
    {
        protected static const WRAPPED_WITH_GET_VPAID:String = "WRAPPED_WITH_GET_VPAID";
        protected static const STANDARD:String = "STANDARD";

        protected var _Str_2492:*;
        protected var _Str_18659:int = -1;
        protected var _Str_18401:int = -1;
        protected var _Str_11790:Boolean = false;
        protected var _Str_9253:Number = -1;

        public function VPAIDWrapper(k:*, _arg_2:Boolean=false, _arg_3:Number=-1)
        {
            this._Str_11790 = _arg_2;
            this._Str_9253 = _arg_3;
            switch (this._Str_23299(k))
            {
                case WRAPPED_WITH_GET_VPAID:
                    this._Str_2492 = k.getVPAID();
                    return;
                default:
                    this._Str_2492 = k;
            }
        }

        protected function _Str_23299(k:*):String
        {
            var _local_2:XML = describeType(k);
            if (this._Str_24311(k, "getVPAID", _local_2))
            {
                return WRAPPED_WITH_GET_VPAID;
            }
            return STANDARD;
        }

        public function get adLinear():Boolean
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adLinear;
            }
            return false;
        }

        public function get adExpanded():Boolean
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adExpanded;
            }
            return false;
        }

        public function get _Str_23482():Number
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.height;
            }
            return 0;
        }

        public function get _Str_25601():Number
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.width;
            }
            return 0;
        }

        public function get adDuration():Number
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adDuration;
            }
            return 0;
        }

        public function get adSkippableState():Boolean
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adSkippableState;
            }
            return false;
        }

        public function get adRemainingTime():Number
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adRemainingTime;
            }
            return 0;
        }

        public function get adVolume():Number
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adVolume;
            }
            return 0;
        }

        public function set adVolume(k:Number):void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.adVolume = k;
            }
        }

        public function get adCompanions():String
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adCompanions;
            }
            return null;
        }

        public function get adIcons():Boolean
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.adIcons;
            }
            return false;
        }

        protected function _Str_24311(k:*, _arg_2:String, _arg_3:XML=null):Boolean
        {
            return this._Str_11059(k, _arg_2);
        }

        protected function _Str_26056(k:*):String
        {
            var _local_2:String = getQualifiedClassName(k);
            if (_local_2 != null)
            {
                return _local_2.substr(0, _local_2.indexOf("::"));
            }
            return "";
        }

        protected function _Str_11059(ad:*, methodName:String):Boolean
        {
            if (ad != null)
            {
                try
                {
                    return !(ad[methodName] == undefined);
                }
                catch(e:Error)
                {
                }
            }
            return false;
        }

        public function isV100():Boolean
        {
            return (this._Str_11059(this._Str_2492, "initVPAIDVersion")) && (this._Str_11059(this._Str_2492, "init"));
        }

        public function isV110():Boolean
        {
            return (this._Str_11059(this._Str_2492, "handshakeVersion")) && (this._Str_11059(this._Str_2492, "initAd"));
        }

        public function initVPAIDVersion(k:String):String
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.initVPAIDVersion(k);
            }
            return "0.0.0";
        }

        public function handshakeVersion(k:String):String
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.handshakeVersion(k);
            }
            return "0.0.0";
        }

        public function initAd(k:Number, _arg_2:Number, _arg_3:String, _arg_4:Number, _arg_5:String, _arg_6:String):void
        {
            var _local_7:int;
            var _local_8:int;
            if (this._Str_2492 != null)
            {
                _local_7 = parseInt(k.toFixed(0));
                _local_8 = parseInt(_arg_2.toFixed(0));
                this._Str_18659 = _local_7;
                this._Str_18401 = _local_8;
                this._Str_2492.initAd(_local_7, _local_8, _arg_3, _arg_4, _arg_5, _arg_6);
            }
        }

        public function resizeAd(width:Number, height:Number, viewMode:String):void
        {
            var fixedWidth:int;
            var fixedHeight:int;
            try
            {
                fixedWidth = parseInt(width.toFixed(0));
                fixedHeight = parseInt(height.toFixed(0));
                if (((!(this._Str_18659 == fixedWidth)) || (!(this._Str_18401 == fixedHeight))))
                {
                    this._Str_18659 = fixedWidth;
                    this._Str_18401 = fixedHeight;
                    this._Str_2492.resizeAd(fixedWidth, fixedHeight, viewMode);
                }
            }
            catch(e:Error)
            {
            }
        }

        public function startAd():void
        {
            if (this._Str_2492 != null)
            {
                if (this._Str_11790)
                {
                    this._Str_2492.adVolume = 0;
                }
                else
                {
                    if (this._Str_9253 > -1)
                    {
                        this._Str_2492.adVolume = this._Str_9253;
                    }
                }
                this._Str_2492.startAd();
            }
        }

        public function stopAd():void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.stopAd();
            }
        }

        public function pauseAd():void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.pauseAd();
            }
        }

        public function resumeAd():void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.resumeAd();
            }
        }

        public function skipAd():void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.skipAd();
            }
        }

        public function expandAd():void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.expandAd();
            }
        }

        public function collapseAd():void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.collapseAd();
            }
        }

        override public function addEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.addEventListener(k, _arg_2, _arg_3, _arg_4, _arg_5);
            }
        }

        override public function removeEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            if (this._Str_2492 != null)
            {
                this._Str_2492.removeEventListener(k, _arg_2, _arg_3);
            }
        }

        override public function dispatchEvent(k:Event):Boolean
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.dispatchEvent(k);
            }
            return false;
        }

        override public function hasEventListener(k:String):Boolean
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.hasEventListener(k);
            }
            return false;
        }

        override public function willTrigger(k:String):Boolean
        {
            if (this._Str_2492 != null)
            {
                return this._Str_2492.willTrigger(k);
            }
            return false;
        }

        public function _Str_12035():Object
        {
            var k:Object = new Object();
            k["adExpanded"] = this.adExpanded;
            k["adLinear"] = this.adLinear;
            k["adRemainingTime"] = this.adRemainingTime;
            k["adVolume"] = this.adVolume;
            return k;
        }
    }
}
