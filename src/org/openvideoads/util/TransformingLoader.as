package org.openvideoads.util
{
    import flash.net.URLLoader;

    public class TransformingLoader extends URLLoader 
    {
        protected var _Str_3676:Array = null;


        public function set transformers(k:Array):void
        {
            this._Str_3676 = k;
        }

        public function get transformedData():String
        {
            var k:String;
            var _local_2:int;
            if (this._Str_3676 != null)
            {
                if (this._Str_3676.length > 0)
                {
                    k = super.data;
                    _local_2 = 0;
                    while (_local_2 < this._Str_3676.length)
                    {
                        if (((this._Str_3676[_local_2].hasOwnProperty("pattern")) && (this._Str_3676[_local_2].hasOwnProperty("replace"))))
                        {
                            k = k.replace(new RegExp(this._Str_3676[_local_2].pattern, ((this._Str_3676[_local_2].hasOwnProperty("command")) ? this._Str_3676[_local_2].hasOwnProperty("command") : "g")), this._Str_3676[_local_2].replace);
                        }
                        _local_2++;
                    }
                }
                return k;
            }
            return super.data;
        }
    }
}
