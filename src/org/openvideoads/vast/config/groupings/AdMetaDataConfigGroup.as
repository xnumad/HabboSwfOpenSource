package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;

    public class AdMetaDataConfigGroup extends Debuggable 
    {
        protected var _Str_8619:LinearAdMetaDataConfig;

        public function AdMetaDataConfigGroup(k:Object=null)
        {
            this._Str_8619 = new LinearAdMetaDataConfig();
            super();
            this.initialise(k);
        }

        public function initialise(k:Object):void
        {
            if (k != null)
            {
                if (k.linear != undefined)
                {
                    this._Str_8619.initialise(k.linear);
                }
            }
        }

        public function _Str_19879(k:String="", _arg_2:String="0", _arg_3:int=-1):String
        {
            if (this._Str_8619 != null)
            {
                return this._Str_8619._Str_25280(k, _arg_2, _arg_3);
            }
            return "";
        }

        public function _Str_19524(k:String="", _arg_2:String="0", _arg_3:int=-1):String
        {
            if (this._Str_8619 != null)
            {
                return this._Str_8619._Str_23078(k, _arg_2, _arg_3);
            }
            return "";
        }
    }
}
