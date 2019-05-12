package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;

    public class LinearAdMetaDataConfig extends Debuggable 
    {
        protected var _Str_2495:String = null;
        protected var _Str_1858:String = null;

        public function LinearAdMetaDataConfig(k:Object=null)
        {
            this.initialise(k);
        }

        public function initialise(k:Object):void
        {
            if (k != null)
            {
                if (k.title != undefined)
                {
                    this._Str_2495 = k.title;
                }
                if (k.description != undefined)
                {
                    this._Str_1858 = k.description;
                }
            }
        }

        public function get title():String
        {
            return this._Str_2495;
        }

        public function set title(k:String):void
        {
            this._Str_2495 = k;
        }

        public function _Str_24997():Boolean
        {
            return !(this._Str_2495 == null);
        }

        public function get description():String
        {
            return this._Str_1858;
        }

        public function set description(k:String):void
        {
            this._Str_1858 = k;
        }

        public function _Str_22342():Boolean
        {
            return !(this._Str_1858 == null);
        }

        protected function _Str_14334(k:String, _arg_2:String, _arg_3:String):String
        {
            var _local_4:RegExp = new RegExp(_arg_2, "g");
            return k.replace(_local_4, _arg_3);
        }

        public function _Str_25280(k:String="", _arg_2:String="0", _arg_3:int=-1):String
        {
            var _local_4:String;
            if (this._Str_24997())
            {
                _local_4 = this._Str_14334(this._Str_2495, "__duration__", _arg_2);
                _local_4 = this._Str_14334(_local_4, "__index__", new String(_arg_3));
                return _local_4;
            }
            return k;
        }

        public function _Str_23078(k:String="", _arg_2:String="0", _arg_3:int=-1):String
        {
            var _local_4:String;
            if (this._Str_22342())
            {
                _local_4 = this._Str_14334(this._Str_1858, "__duration__", _arg_2);
                _local_4 = this._Str_14334(_local_4, "__index__", new String(_arg_3));
                return _local_4;
            }
            return k;
        }
    }
}
