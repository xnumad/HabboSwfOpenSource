package org.openvideoads.util
{
    import org.openvideoads.base.Debuggable;

    public class MarginsSpecification extends Debuggable 
    {
        protected var _normal:Object;
        protected var _Str_3106:Object;

        public function MarginsSpecification(k:Object=null)
        {
            this._normal = {
                "withControls":0,
                "withControlsOverride":-1,
                "withoutControls":0,
                "withoutControlsOverride":-1
            }
            this._Str_3106 = {
                "withControls":0,
                "withControlsOverride":-1,
                "withoutControls":0,
                "withoutControlsOverride":-1
            }
            super();
            this.initialise(k);
        }

        public function initialise(k:Object):void
        {
            if (k != null)
            {
                this._Str_13982(this._normal, k);
                this._Str_13982(this._Str_3106, k);
                if (k.hasOwnProperty("normal"))
                {
                    this._Str_21243 = k.normal;
                }
                if (k.hasOwnProperty("fullscreen"))
                {
                    this._Str_19698 = k.fullscreen;
                }
            }
        }

        public function set _Str_21243(k:Object):void
        {
            this._Str_13982(this._normal, k);
        }

        public function get _Str_21243():Object
        {
            return this._normal;
        }

        public function set _Str_19698(k:Object):void
        {
            this._Str_13982(this._Str_3106, k);
        }

        public function get _Str_19698():Object
        {
            return this._Str_3106;
        }

        public function getWithControlsMargin(k:String, _arg_2:Boolean=false):Number
        {
            if (StringUtils._Str_2576(k, "NORMAL"))
            {
                if (_arg_2)
                {
                    if (this._normal.hasOwnProperty("withControlsOverride"))
                    {
                        if (this._normal.withControlsOverride > -1)
                        {
                            return this._normal.withControlsOverride;
                        }
                    }
                }
                if (this._normal.hasOwnProperty("withControls"))
                {
                    return this._normal.withControls;
                }
            }
            else
            {
                if (_arg_2)
                {
                    if (this._Str_3106.hasOwnProperty("withControlsOverride"))
                    {
                        if (this._Str_3106.withControlsOverride > -1)
                        {
                            return this._Str_3106.withControlsOverride;
                        }
                    }
                }
                if (this._Str_3106.hasOwnProperty("withControls"))
                {
                    return this._Str_3106.withControls;
                }
            }
            return 0;
        }

        public function getWithoutControlsMargin(k:String, _arg_2:Boolean=false):Number
        {
            if (StringUtils._Str_2576(k, "NORMAL"))
            {
                if (_arg_2)
                {
                    if (this._normal.hasOwnProperty("withoutControlsOverride"))
                    {
                        if (this._normal.withoutControlsOverride > -1)
                        {
                            return this._normal.withoutControlsOverride;
                        }
                    }
                }
                if (this._normal.hasOwnProperty("withoutControls"))
                {
                    return this._normal.withoutControls;
                }
            }
            else
            {
                if (_arg_2)
                {
                    if (this._Str_3106.hasOwnProperty("withoutControlsOverride"))
                    {
                        if (this._Str_3106.withoutControlsOverride > -1)
                        {
                            return this._Str_3106.withoutControlsOverride;
                        }
                    }
                }
                if (this._Str_3106.hasOwnProperty("withoutControls"))
                {
                    return this._Str_3106.withoutControls;
                }
            }
            return 0;
        }

        public function _Str_25936():Number
        {
            return this.getWithControlsMargin("normal");
        }

        public function _Str_26392():Number
        {
            return this.getWithoutControlsMargin("normal");
        }

        public function _Str_26292():Number
        {
            return this.getWithControlsMargin("fullscreen");
        }

        public function _Str_25998():Number
        {
            return this.getWithoutControlsMargin("fullscreen");
        }

        protected function _Str_13982(k:Object, _arg_2:Object):void
        {
            if (_arg_2.hasOwnProperty("withControls"))
            {
                k.withControls = _arg_2.withControls;
            }
            if (_arg_2.hasOwnProperty("withControlsOverride"))
            {
                k.withControlsOverride = _arg_2.withControlsOverride;
            }
            if (_arg_2.hasOwnProperty("withoutControls"))
            {
                k.withoutControls = _arg_2.withoutControls;
            }
            if (_arg_2.hasOwnProperty("withoutControlsOverride"))
            {
                k.withoutControlsOverride = _arg_2.withoutControlsOverride;
            }
        }
    }
}
