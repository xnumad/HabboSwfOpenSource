package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;

    public class StreamTimerConfig extends Debuggable 
    {
        protected var _Str_2699:Boolean = false;
        protected var _Str_18281:Number = 100;
        protected var _Str_16130:Number = 100000;

        public function StreamTimerConfig(k:Object=null)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        public function initialise(k:Object):void
        {
            if (k != null)
            {
                if (k.enabled != undefined)
                {
                    if ((k.enabled is String))
                    {
                        this._Str_2699 = (k.enabled.toUpperCase() == "TRUE");
                    }
                    else
                    {
                        this._Str_2699 = k.enabled;
                    }
                }
                if (k.tickRate != undefined)
                {
                    this._Str_18281 = k.tickRate;
                }
                if (k.cycles != undefined)
                {
                    this._Str_16130 = k.cycles;
                }
            }
        }

        public function set enabled(k:Boolean):void
        {
            this._Str_2699 = k;
        }

        public function get enabled():Boolean
        {
            return this._Str_2699;
        }

        public function set tickRate(k:Number):void
        {
            this._Str_18281 = k;
        }

        public function get tickRate():Number
        {
            return this._Str_18281;
        }

        public function set cycles(k:Number):void
        {
            this._Str_16130 = k;
        }

        public function get cycles():Number
        {
            return this._Str_16130;
        }
    }
}
