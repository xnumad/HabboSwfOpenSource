package org.openvideoads.vast.model
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.StringUtils;

    public class MediaFile extends Debuggable 
    {
        protected var _Str_577:AdNetworkResource = null;
        protected var _id:String;
        protected var _Str_18599:String;
        protected var _Str_6705:String;
        protected var _scale:Boolean = false;
        protected var _Str_6419:Boolean = true;
        protected var _Str_2230:String;
        protected var _Str_15448:int = -1;
        protected var _width:String;
        protected var _height:String;
        protected var _Str_4949:String = null;
        protected var _Str_5000:String = null;
        protected var _Str_3543:TrackedVideoAd = null;


        public function unload():void
        {
        }

        public function set id(k:String):void
        {
            this._id = k;
        }

        public function get id():String
        {
            return this._id;
        }

        public function set _Str_19024(k:TrackedVideoAd):void
        {
            this._Str_3543 = k;
        }

        public function get _Str_19024():TrackedVideoAd
        {
            return this._Str_3543;
        }

        public function set url(k:AdNetworkResource):void
        {
            this._Str_577 = k;
        }

        public function get url():AdNetworkResource
        {
            return this._Str_577;
        }

        public function set bandwidth(k:String):void
        {
            this._Str_18599 = k;
        }

        public function get bandwidth():String
        {
            return this._Str_18599;
        }

        public function get duration():String
        {
            if (this._Str_3543 != null)
            {
                return this._Str_3543.duration;
            }
            return "00:00:00";
        }

        public function _Str_26336():int
        {
            return 0;
        }

        public function set delivery(k:String):void
        {
            this._Str_6705 = k;
        }

        public function get delivery():String
        {
            return this._Str_6705;
        }

        public function set apiFramework(k:String):void
        {
            this._Str_4949 = k;
        }

        public function get apiFramework():String
        {
            return this._Str_4949;
        }

        public function _Str_21162():Boolean
        {
            return !(this._Str_4949 == null);
        }

        public function set adParameters(k:String):void
        {
            this._Str_5000 = k;
        }

        public function get adParameters():String
        {
            return this._Str_5000;
        }

        public function _Str_16651():Boolean
        {
            return !(StringUtils.isEmpty(this._Str_5000));
        }

        public function _parser4():Boolean
        {
            if (this._Str_6705 != null)
            {
                return this._Str_6705.toUpperCase() == "PROGRESSIVE";
            }
            return false;
        }

        public function _Str_25975():Boolean
        {
            if (this._Str_6705 != null)
            {
                return this._Str_6705.toUpperCase() == "STREAMING";
            }
            return false;
        }

        public function set scale(k:*):void
        {
            if (k != null)
            {
                this._scale = StringUtils._Str_2810(k);
            }
        }

        public function get scale():Boolean
        {
            return this._scale;
        }

        public function set maintainAspectRatio(k:*):void
        {
            if (k != null)
            {
                this._Str_6419 = StringUtils._Str_2810(k);
            }
        }

        public function get maintainAspectRatio():Boolean
        {
            return this._Str_6419;
        }

        public function _Str_17899():Boolean
        {
            return !(this._Str_2230 == null);
        }

        public function set mimeType(k:String):void
        {
            this._Str_2230 = k;
        }

        public function get mimeType():String
        {
            return this._Str_2230;
        }

        public function isPermittedMimeType(k:Array):Boolean
        {
            if (((this._Str_17899() == false) || (k == null)))
            {
                return true;
            }
            var _local_2:int;
            while (_local_2 < k.length)
            {
                if (StringUtils._Str_2576(this._Str_2230, k[_local_2]))
                {
                    return true;
                }
                _local_2++;
            }
            return false;
        }

        public function isInteractive():Boolean
        {
            if (this._Str_21162())
            {
                if (StringUtils._Str_2576(this._Str_4949, "VPAID"))
                {
                    if (this._Str_17899())
                    {
                        return (StringUtils._Str_2576(this._Str_2230, "APPLICATION/X-SHOCKWAVE-FLASH")) || (StringUtils._Str_2576(this._Str_2230, "SWF"));
                    }
                    if (this._Str_577 != null)
                    {
                        return this._Str_577.isStream() == false;
                    }
                }
            }
            return false;
        }

        public function set bitRate(k:int):void
        {
            this._Str_15448 = k;
        }

        public function get bitRate():int
        {
            return this._Str_15448;
        }

        public function hasBitRate():Boolean
        {
            return this._Str_15448 > -1;
        }

        public function set width(k:String):void
        {
            this._width = k;
        }

        public function get width():String
        {
            return this._width;
        }

        public function set height(k:String):void
        {
            this._height = k;
        }

        public function get height():String
        {
            return this._height;
        }

        public function isMimeType(k:*):Boolean
        {
            if (k == null)
            {
                return true;
            }
            if ((k is Array))
            {
                return this.isPermittedMimeType(k);
            }
            return (k.toUpperCase() == "ANY") || (this._Str_2230.toUpperCase() == k.toUpperCase());
        }

        public function isDeliveryType(k:String):Boolean
        {
            if (k == null)
            {
                return true;
            }
            return (k.toUpperCase() == "ANY") || (this._Str_6705.toUpperCase() == k.toUpperCase());
        }

        override public function toJSObject():Object
        {
            var k:Object = new Object();
            k = {
                "id":this._id,
                "uid":_Str_2995,
                "bandwidth":this._Str_18599,
                "delivery":this._Str_6705,
                "scale":this._scale,
                "maintainAspectRatio":this._Str_6419,
                "mimeType":this._Str_2230,
                "bitRate":this._Str_15448,
                "width":this._width,
                "height":this._height,
                "apiFramework":this._Str_4949,
                "urlId":((this._Str_577 != null) ? this._Str_577.id : null),
                "url":((this._Str_577 != null) ? this._Str_577.url : null),
                "adParameters":((this._Str_5000 != null) ? escape(this._Str_5000) : null)
            }
            return k;
        }
    }
}
