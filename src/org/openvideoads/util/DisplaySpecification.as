package org.openvideoads.util
{
    import org.openvideoads.base.Debuggable;

    public class DisplaySpecification extends Debuggable 
    {
        public static const LINEAR:String = "linear";
        public static const NONLINEAR:String = "nonLinear";

        protected var _Str_1069:String = null;
        protected var _width:int = 0;
        protected var _height:int = 0;
        protected var _Str_19252:Boolean = false;
        protected var _Str_11897:Boolean = false;
        protected var _Str_8374:MarginsSpecification;
        protected var _Str_3430:Object;

        public function DisplaySpecification(k:*)
        {
            this._Str_8374 = new MarginsSpecification();
            this._Str_3430 = {
                "stream":new ControlsSpecification(),
                "vpaid":new ControlsSpecification({
                    "visible":false,
                    "enabled":false
                })
            }
            super();
            if ((k is String))
            {
                this._Str_1069 = k;
            }
            else
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object):void
        {
            if (k.hasOwnProperty("width"))
            {
                if ((k.width is String))
                {
                    this.width = parseInt(k.width);
                }
                else
                {
                    this.width = k.width;
                }
            }
            if (k.hasOwnProperty("width"))
            {
                if ((k.height is String))
                {
                    this.height = parseInt(k.height);
                }
                else
                {
                    this.height = k.height;
                }
            }
            if (k.hasOwnProperty("hideLogo"))
            {
                if ((k.height is String))
                {
                    this.hideLogo = StringUtils._Str_2576(k.hideLogo, "TRUE");
                }
                else
                {
                    this.hideLogo = k.hideLogo;
                }
            }
            if (k.hasOwnProperty("scalable"))
            {
                this.scalable = StringUtils._Str_2810(k.scalable);
            }
            if (k.hasOwnProperty("controls"))
            {
                this.controls = k.controls;
            }
            if (k.hasOwnProperty("margins"))
            {
                this.margins = k.margins;
            }
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

        public function set scalable(k:Boolean):void
        {
            this._Str_11897 = k;
        }

        public function get scalable():Boolean
        {
            return this._Str_11897;
        }

        public function set hideLogo(k:Boolean):void
        {
            this._Str_19252 = k;
        }

        public function get hideLogo():Boolean
        {
            return this._Str_19252;
        }

        public function set controls(k:Object):void
        {
            if (k != null)
            {
                this._Str_3430.stream.initialise(k);
                this._Str_3430.vpaid.initialise(k);
                if (k.hasOwnProperty("stream"))
                {
                    this._Str_3430.stream.initialise(k.stream);
                }
                if (k.hasOwnProperty("vpaid"))
                {
                    this._Str_3430.vpaid.initialise(k.vpaid);
                }
            }
        }

        public function get controls():Object
        {
            return this._Str_3430;
        }

        public function set _Str_25819(k:ControlsSpecification):void
        {
            this._Str_3430.stream = k;
        }

        public function get _Str_25819():ControlsSpecification
        {
            return this._Str_3430.stream;
        }

        public function set _Str_23791(k:ControlsSpecification):void
        {
            this._Str_3430.vpaid = k;
        }

        public function get _Str_23791():ControlsSpecification
        {
            return this._Str_3430.vpaid;
        }

        public function shouldDisableControlsDuringLinearAds(k:Boolean=false):Boolean
        {
            if (k)
            {
                return this._Str_3430.vpaid.enabled == false;
            }
            return this._Str_3430.stream.enabled == false;
        }

        public function shouldManageControlsDuringLinearAds(k:Boolean=false):Boolean
        {
            if (k)
            {
                return this._Str_3430.vpaid.manage;
            }
            return this._Str_3430.stream.manage;
        }

        public function controlEnabledForLinearAdType(k:String, _arg_2:Boolean):Boolean
        {
            if (this.shouldManageControlsDuringLinearAds(_arg_2) == false)
            {
                return true;
            }
            if (_arg_2)
            {
                return this._Str_3430.vpaid.controlEnabled(k);
            }
            return this._Str_3430.stream.controlEnabled(k);
        }

        public function hideControlsOnLinearPlayback(k:Boolean=false):Boolean
        {
            if (this.shouldManageControlsDuringLinearAds(k))
            {
                if (k)
                {
                    return this._Str_3430.vpaid.visible == false;
                }
                return this._Str_3430.stream.visible == false;
            }
            return false;
        }

        public function _Str_26198(k:Boolean=false):Boolean
        {
            if (this.shouldManageControlsDuringLinearAds(k))
            {
                if (k)
                {
                    return this._Str_3430.vpaid.visible == false;
                }
                return this._Str_3430.stream.visible == false;
            }
            return false;
        }

        public function set margins(k:Object):void
        {
            if (this._Str_8374 == null)
            {
                this._Str_8374 = new MarginsSpecification(k);
            }
            else
            {
                this._Str_8374.initialise(k);
            }
        }

        public function set marginsSpecification(k:MarginsSpecification):void
        {
            this._Str_8374 = k;
        }

        public function get marginsSpecification():MarginsSpecification
        {
            return this._Str_8374;
        }

        public function toString():String
        {
            return ((((("{ mode: " + this._Str_1069) + ", width: ") + this.width) + ", height: ") + this.height) + " }";
        }
    }
}
