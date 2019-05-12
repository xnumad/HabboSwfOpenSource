package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.util.ArrayUtils;

    public class CompanionsConfigGroup extends Debuggable 
    {
        protected var _Str_6910:Array;
        protected var _Str_18863:Boolean = true;
        protected var _Str_21492:Boolean = true;
        protected var _Str_10909:Boolean = true;
        protected var _Str_18241:int = 0;
        protected var _Str_13667:Array;

        public function CompanionsConfigGroup(k:Object=null)
        {
            this._Str_6910 = new Array();
            this._Str_13667 = new Array();
            super();
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object=null):void
        {
            if (k.regions != undefined)
            {
                if ((k.regions is String))
                {
                    this.companionDivIDs = ArrayUtils._Str_8734(k.regions);
                }
                else
                {
                    this.companionDivIDs = k.regions;
                }
            }
            if (k.enable != undefined)
            {
                if ((k.enable is String))
                {
                    this.displayCompanions = (k.enable.toUpperCase() == "TRUE");
                }
                else
                {
                    this.displayCompanions = k.enable;
                }
            }
            if (k.html5 != undefined)
            {
                if ((k.html5 is String))
                {
                    this.nativeDisplay = (!(k.html5.toUpperCase() == "TRUE"));
                }
                else
                {
                    this.nativeDisplay = (!(k.html5));
                }
            }
            if (k.nativeDisplay != undefined)
            {
                if ((k.nativeDisplay is String))
                {
                    this.nativeDisplay = (k.nativeDisplay.toUpperCase() == "TRUE");
                }
                else
                {
                    this.nativeDisplay = k.nativeDisplay;
                }
            }
            if (k.restore != undefined)
            {
                if ((k.restore is String))
                {
                    this.restoreCompanions = (k.restore.toUpperCase() == "TRUE");
                }
                else
                {
                    this.restoreCompanions = k.restore;
                }
            }
            if (k.additionalParamsForSWFCompanions != undefined)
            {
                if ((k.additionalParamsForSWFCompanions is Array))
                {
                    this._Str_13667 = k.additionalParamsForSWFCompanions;
                }
            }
            if (k.millisecondDelayOnInjection != undefined)
            {
                if ((k.millisecondDelayOnInjection is String))
                {
                    this.millisecondDelayOnCompanionInjection = int(k.millisecondDelayOnInjection);
                }
                else
                {
                    this.millisecondDelayOnCompanionInjection = k.millisecondDelayOnInjection;
                }
            }
        }

        public function _Str_8478():Boolean
        {
            return this._Str_6910.length > 0;
        }

        public function set companionDivIDs(k:Array):void
        {
            var _local_2:int;
            if (k != null)
            {
                _local_2 = 0;
                while (_local_2 < k.length)
                {
                    if (k[_local_2].hasOwnProperty("width"))
                    {
                        if ((k[_local_2].width is String))
                        {
                            k[_local_2].width = new Number(k[_local_2].width);
                        }
                    }
                    if (k[_local_2].hasOwnProperty("height"))
                    {
                        if ((k[_local_2].height is String))
                        {
                            k[_local_2].height = new Number(k[_local_2].height);
                        }
                    }
                    _local_2++;
                }
            }
            this._Str_6910 = k;
        }

        public function get companionDivIDs():Array
        {
            return this._Str_6910;
        }

        public function set displayCompanions(k:Boolean):void
        {
            this._Str_18863 = k;
        }

        public function get displayCompanions():Boolean
        {
            if (this._Str_18863 == false)
            {
                return this._Str_18863;
            }
            return this._Str_8478();
        }

        public function set nativeDisplay(k:Boolean):void
        {
            this._Str_10909 = k;
        }

        public function get nativeDisplay():Boolean
        {
            return this._Str_10909;
        }

        public function set restoreCompanions(k:Boolean):void
        {
            this._Str_21492 = k;
        }

        public function get restoreCompanions():Boolean
        {
            return this._Str_21492;
        }

        public function set millisecondDelayOnCompanionInjection(k:int):void
        {
            this._Str_18241 = k;
        }

        public function get millisecondDelayOnCompanionInjection():int
        {
            return this._Str_18241;
        }

        public function _Str_12146():Boolean
        {
            return this._Str_18241 > 0;
        }

        public function set additionalParamsForSWFCompanions(k:Array):void
        {
            this._Str_13667 = k;
        }

        public function get additionalParamsForSWFCompanions():Array
        {
            return this._Str_13667;
        }
    }
}
