package org.openvideoads.vast.server.config
{
    import org.openvideoads.base.Debuggable;
    import flash.utils.Dictionary;

    public class CustomProperties extends Debuggable 
    {
        protected var _Str_7517:Dictionary;

        public function CustomProperties(k:Object=null)
        {
            this._Str_7517 = new Dictionary();
            super();
            this._Str_17005(k);
        }

        public function _Str_17005(k:Object):void
        {
            var _local_2:String;
            if (k != null)
            {
                for (_local_2 in k)
                {
                    this._Str_7517[_local_2] = k[_local_2];
                }
            }
        }

        protected function _Str_23661(k:Array):String
        {
            var _local_2:String = "";
            var _local_3:int;
            while (_local_3 < k.length)
            {
                if (_local_2.length > 0)
                {
                    _local_2 = (_local_2 + "&");
                }
                _local_2 = (_local_2 + k[_local_3]);
                _local_3++;
            }
            return _local_2;
        }

        public function completeTemplate(k:String, _arg_2:Boolean=false):String
        {
            var _local_3:RegExp;
            var _local_4:String;
            var _local_5:String;
            var _local_6:String;
            for (_local_5 in this._Str_7517)
            {
                _local_6 = (("__" + _local_5) + "__");
                if (k.indexOf(_local_6) > -1)
                {
                    _local_3 = new RegExp(_local_6, "g");
                    if ((this._Str_7517[_local_5] is Array))
                    {
                        k = k.replace(_local_3, this._Str_23661(this._Str_7517[_local_5]));
                    }
                    else
                    {
                        k = k.replace(_local_3, this._Str_7517[_local_5]);
                    }
                }
                else
                {
                    if (_arg_2)
                    {
                        k = (k + ((("&" + _local_5) + "=") + this._Str_7517[_local_5]));
                    }
                }
            }
            return k;
        }
    }
}
