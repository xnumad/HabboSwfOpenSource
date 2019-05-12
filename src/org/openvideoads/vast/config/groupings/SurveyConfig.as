package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;

    public class SurveyConfig extends Debuggable 
    {
        protected var _Str_576:String = null;
        protected var _Str_17492:Boolean = true;

        public function SurveyConfig(k:Object=null)
        {
            if (k != null)
            {
                this.initialise(k);
            }
        }

        protected function initialise(k:Object):void
        {
            if (k.id != undefined)
            {
                this._Str_576 = k.id;
            }
            if (k.restore != undefined)
            {
                if ((k.restore is String))
                {
                    this._Str_17492 = ((k.restore.toUpperCase() == "TRUE") ? true : false);
                }
                else
                {
                    this._Str_17492 = k.restore;
                }
            }
        }

        public function get id():String
        {
            return this._Str_576;
        }

        public function declared():Boolean
        {
            return !(this._Str_576 == null);
        }

        public function get restore():Boolean
        {
            return this._Str_17492;
        }
    }
}
