package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.util.ControlsSpecification;
    import org.openvideoads.util.DisplaySpecification;
    import org.openvideoads.vast.config._Str_2741;
    import org.openvideoads.util.MarginsSpecification;

    public class PlayerConfigGroup extends _Str_3389 
    {
        protected var _Str_15349:int = -1;
        protected var _Str_21473:int = -1;
        protected var _Str_6597:ControlsSpecification;
        protected var _Str_21329:Boolean = false;
        protected var _Str_21737:Boolean = true;
        protected var _Str_21284:Boolean = true;
        protected var _Str_21401:Boolean = false;
        protected var _Str_3090:Object;

        public function PlayerConfigGroup(k:Object=null, _arg_2:_Str_2741=null)
        {
            this._Str_6597 = new ControlsSpecification();
            this._Str_3090 = {
                "linear":new DisplaySpecification(DisplaySpecification.LINEAR),
                "nonLinear":new DisplaySpecification(DisplaySpecification.NONLINEAR)
            }
            super(k, _arg_2);
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            _Str_3654();
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k.hasOwnProperty("modes"))
                {
                    if (k.modes.hasOwnProperty("linear"))
                    {
                        this._Str_3090.linear.initialise(k.modes.linear);
                    }
                    if (k.modes.hasOwnProperty("nonLinear"))
                    {
                        this._Str_3090.nonLinear.initialise(k.modes.nonLinear);
                    }
                }
                if (k.hasOwnProperty("width"))
                {
                    this.width = k.width;
                }
                if (k.hasOwnProperty("height"))
                {
                    this.height = k.height;
                }
                if (k.hasOwnProperty("controls"))
                {
                    this.controls = k.controls;
                }
                if (k.hasOwnProperty("margins"))
                {
                    this.margins = k.margins;
                }
                if (k.hasOwnProperty("setUrlResolversOnAdClips"))
                {
                    if ((k.setUrlResolversOnAdClips is String))
                    {
                        this.setUrlResolversOnAdClips = ((k.setUrlResolversOnAdClips.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.setUrlResolversOnAdClips = k.setUrlResolversOnAdClips;
                    }
                }
                if (k.hasOwnProperty("showBusyIcon"))
                {
                    if ((k.showBusyIcon is String))
                    {
                        this.showBusyIcon = ((k.showBusyIcon.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.showBusyIcon = k.showBusyIcon;
                    }
                }
                if (k.hasOwnProperty("applyCommonClipProperties"))
                {
                    if ((k.applyCommonClipProperties is String))
                    {
                        this.applyCommonClipProperties = ((k.applyCommonClipProperties.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.applyCommonClipProperties = k.applyCommonClipProperties;
                    }
                }
            }
            _Str_3144();
        }

        public function _Str_18778():Boolean
        {
            return this.height > -1;
        }

        public function _Str_16865():Boolean
        {
            return this.width > -1;
        }

        public function set height(k:*):void
        {
            var _local_2:int;
            if ((k is String))
            {
                _local_2 = parseInt(k);
            }
            else
            {
                _local_2 = k;
            }
            this._Str_21473 = _local_2;
            this._Str_3090.linear.height = _local_2;
            this._Str_3090.nonLinear.height = _local_2;
        }

        public function get height():int
        {
            return this._Str_21473;
        }

        public function set width(k:*):void
        {
            var _local_2:int;
            if ((k is String))
            {
                _local_2 = parseInt(k);
            }
            else
            {
                _local_2 = k;
            }
            this._Str_15349 = _local_2;
            this._Str_3090.linear.width = _local_2;
            this._Str_3090.nonLinear.width = _local_2;
        }

        public function get width():int
        {
            return this._Str_15349;
        }

        public function set _Str_23327(k:Boolean):void
        {
            this._Str_21329 = k;
        }

        public function get _Str_23327():Boolean
        {
            return this._Str_21329;
        }

        public function set controls(k:*):void
        {
            if ((k is ControlsSpecification))
            {
                this._Str_6597 = k;
                this._Str_3090.linear.controlsConfig = k;
                this._Str_3090.nonLinear.controlsConfig = k;
            }
            else
            {
                this._Str_6597.initialise(k);
                this._Str_3090.linear.initialise({"controls":k});
                this._Str_3090.nonLinear.initialise({"controls":k});
            }
        }

        public function get _Str_26374():Object
        {
            return this._Str_3090.linear.controls;
        }

        public function get _Str_26119():Object
        {
            return this._Str_3090.nonLinear.controls;
        }

        public function get _Str_26078():ControlsSpecification
        {
            return this._Str_6597;
        }

        public function controlEnabledForLinearAdType(k:String, _arg_2:Boolean):Boolean
        {
            return this._Str_3090.linear.controlEnabledForLinearAdType(k, _arg_2);
        }

        public function _Str_26305():Boolean
        {
            if (this._Str_6597 != null)
            {
                return this._Str_6597.hasHeightSpecified();
            }
            return false;
        }

        public function _Str_26126():Number
        {
            if (this._Str_6597 != null)
            {
                return this._Str_6597.height;
            }
            return -1;
        }

        public function set setUrlResolversOnAdClips(k:Boolean):void
        {
            this._Str_21737 = k;
        }

        public function get setUrlResolversOnAdClips():Boolean
        {
            return this._Str_21737;
        }

        public function set applyCommonClipProperties(k:Boolean):void
        {
            this._Str_21401 = k;
        }

        public function get applyCommonClipProperties():Boolean
        {
            return this._Str_21401;
        }

        public function set showBusyIcon(k:Boolean):void
        {
            this._Str_21284 = k;
        }

        public function get showBusyIcon():Boolean
        {
            return this._Str_21284;
        }

        public function set margins(k:*):void
        {
            if ((k is MarginsSpecification))
            {
                this._Str_3090.linear.marginsSpecification = k;
                this._Str_3090.nonLinear.marginsSpecification = k;
            }
            else
            {
                this._Str_3090.linear.initialise({"margins":k});
                this._Str_3090.nonLinear.initialise({"margins":k});
            }
        }

        public function set modes(k:Object):void
        {
            this._Str_3090 = k;
        }

        public function get modes():Object
        {
            return this._Str_3090;
        }

        public function getDisplaySpecification(k:String):DisplaySpecification
        {
            return this._Str_3090[k];
        }

        public function shouldManageControlsDuringLinearAds(k:Boolean=false):Boolean
        {
            return this._Str_3090.linear.shouldManageControlsDuringLinearAds(k);
        }

        public function shouldDisableControlsDuringLinearAds(k:Boolean=false):Boolean
        {
            return this._Str_3090.linear.shouldDisableControlsDuringLinearAds(k);
        }

        public function shouldHideControlsOnLinearPlayback(k:Boolean=false):Boolean
        {
            return this._Str_3090.linear.hideControlsOnLinearPlayback(k);
        }

        public function set hideLogoOnLinearPlayback(k:Boolean):void
        {
            this._Str_3090.linear.hideLogo = k;
        }

        public function get hideLogoOnLinearPlayback():Boolean
        {
            return this._Str_3090.linear.hideLogo;
        }

        public function toString():String
        {
            var _local_3:DisplaySpecification;
            var k:String = (((("{ defaultWidth: " + this._Str_15349) + ", defaultHeight: ") + this._Str_15349) + " ");
            var _local_2:String = "";
            for each (_local_3 in this._Str_3090)
            {
                k = (k + _local_2);
                k = (k + _local_3.toString());
                _local_2 = ", ";
            }
            return k + " } ";
        }
    }
}
