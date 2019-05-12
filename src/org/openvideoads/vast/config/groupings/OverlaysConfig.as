package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.schedule.ads.templates.*;

    public class OverlaysConfig extends Debuggable 
    {
        protected var _Str_17372:Boolean = true;

        public function OverlaysConfig(k:Object=null)
        {
            this.initialise(k);
        }

        public function initialise(k:Object):void
        {
            if (k != null)
            {
                if (k.hasOwnProperty("replay"))
                {
                    this.replay = k.replay;
                }
            }
        }

        public function set replay(k:*):void
        {
            if ((k is String))
            {
                this._Str_17372 = ((String(k).toUpperCase() == "TRUE") ? true : false);
            }
            else
            {
                this._Str_17372 = k;
            }
        }

        public function get replay():Boolean
        {
            return this._Str_17372;
        }
    }
}
