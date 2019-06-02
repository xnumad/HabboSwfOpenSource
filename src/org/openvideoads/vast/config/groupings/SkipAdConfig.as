package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;

    public class SkipAdConfig extends Debuggable 
    {
        protected var _Str_2699:Boolean = false;
        protected var _Str_2442:Object = null;
        protected var _Str_671:String = null;
        protected var _Str_6712:String = null;
        protected var _Str_4544:String = null;
        protected var _width:int = -1;
        protected var _height:int = -1;
        protected var _Str_17493:int = -1;
        protected var _Str_15975:int = -1;
        protected var _Str_17863:int = -1;
        protected var _Str_22181:Boolean = false;

        public function SkipAdConfig(k:Object=null)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object):void
        {
            if (k.enabled != undefined)
            {
                if ((k.enabled is String))
                {
                    this.enabled = ((k.enabled.toUpperCase() == "TRUE") ? true : false);
                }
                else
                {
                    this.enabled = k.enabled;
                }
            }
            if (k.region != undefined)
            {
                this._Str_2442 = k.region;
            }
            if (k.image != undefined)
            {
                this._Str_671 = k.image;
            }
            if (k.swf != undefined)
            {
                this._Str_6712 = k.swf;
            }
            if (k.html != undefined)
            {
                this._Str_4544 = k.html;
            }
            if (k.skipAdOnClickThrough != undefined)
            {
                if ((k.skipAdOnClickThrough is String))
                {
                    this.skipAdOnClickThrough = ((k.skipAdOnClickThrough.toUpperCase() == "TRUE") ? true : false);
                }
                else
                {
                    this.skipAdOnClickThrough = k.skipAdOnClickThrough;
                }
            }
            if (k.width != undefined)
            {
                if ((k.width is String))
                {
                    this.width = int(k.width);
                }
                else
                {
                    this.width = k.width;
                }
            }
            if (k.height != undefined)
            {
                if ((k.height is String))
                {
                    this.height = int(k.height);
                }
                else
                {
                    this.height = k.height;
                }
            }
            if (k.minimumAdDuration != undefined)
            {
                if ((k.minimumAdDuration is String))
                {
                    this.minimumAdDuration = int(k.minimumAdDuration);
                }
                else
                {
                    this.minimumAdDuration = k.minimumAdDuration;
                }
            }
            if (k.showAfterSeconds != undefined)
            {
                if ((k.showAfterSeconds is String))
                {
                    this.showAfterSeconds = int(k.showAfterSeconds);
                }
                else
                {
                    this.showAfterSeconds = k.showAfterSeconds;
                }
            }
            if (k.showForSeconds != undefined)
            {
                if ((k.showForSeconds is String))
                {
                    this.showForSeconds = int(k.showForSeconds);
                }
                else
                {
                    this.showForSeconds = k.showForSeconds;
                }
            }
        }

        public function set skipAdOnClickThrough(k:Boolean):void
        {
            this._Str_22181 = k;
        }

        public function get skipAdOnClickThrough():Boolean
        {
            return this._Str_22181;
        }

        public function isTimeDelayed():Boolean
        {
            return this._Str_15975 > 0;
        }

        public function set showAfterSeconds(k:int):void
        {
            this._Str_15975 = k;
        }

        public function get showAfterSeconds():int
        {
            return this._Str_15975;
        }

        public function isTimeRestricted():Boolean
        {
            return this._Str_17863 > 0;
        }

        public function set showForSeconds(k:int):void
        {
            this._Str_17863 = k;
        }

        public function get showForSeconds():int
        {
            return this._Str_17863;
        }

        public function isStandardImageButton():Boolean
        {
            return (this.isCustomImageButton() == false) && (this._Str_19315() == false);
        }

        public function isCustomImageButton():Boolean
        {
            return !(this._Str_671 == null);
        }

        public function _Str_19315():Boolean
        {
            return !(this._Str_6712 == null);
        }

        public function isHtmlButton():Boolean
        {
            return !(this._Str_4544 == null);
        }

        public function set enabled(k:Boolean):void
        {
            this._Str_2699 = k;
        }

        public function get enabled():Boolean
        {
            return this._Str_2699;
        }

        public function set region(k:Object):void
        {
            this._Str_2442 = k;
        }

        public function get region():Object
        {
            return this._Str_2442;
        }

        public function _Str_26412():Boolean
        {
            return !(this._Str_2442 == null);
        }

        public function set image(k:String):void
        {
            this._Str_671 = k;
        }

        public function get image():String
        {
            return this._Str_671;
        }

        public function set swf(k:String):void
        {
            this._Str_6712 = k;
        }

        public function get swf():String
        {
            return this._Str_6712;
        }

        public function set html(k:String):void
        {
            this._Str_4544 = k;
        }

        public function get html():String
        {
            return this._Str_4544;
        }

        public function set width(k:int):void
        {
            this._width = k;
        }

        public function get width():int
        {
            return this._width;
        }

        public function set height(k:int):void
        {
            this._height = k;
        }

        public function get height():int
        {
            return this._height;
        }

        public function set minimumAdDuration(k:int):void
        {
            this._Str_17493 = k;
        }

        public function get minimumAdDuration():int
        {
            return this._Str_17493;
        }

        public function hasMinimumAdDuration():Boolean
        {
            return this._Str_17493 > 0;
        }
    }
}
