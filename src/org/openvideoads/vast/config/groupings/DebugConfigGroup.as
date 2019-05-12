package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.vast.config._Str_2741;
    import org.openvideoads.util.StringUtils;

    public class DebugConfigGroup extends _Str_3389 
    {
        private var _debugger:String = "firebug";
        private var _levels:String = "fatal, config";

        public function DebugConfigGroup(k:Object=null, _arg_2:_Str_2741=null)
        {
            super(k, _arg_2);
        }

        override public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            _Str_3654();
            super.initialise(k, _arg_2);
            if (k != null)
            {
                if (k.levels != undefined)
                {
                    this.levels = k.levels;
                }
                if (k.debugger != undefined)
                {
                    this.debugger = k.debugger;
                }
            }
            _Str_3144();
        }

        public function _Str_16875():Boolean
        {
            return !(this._debugger == null);
        }

        public function set debugger(k:String):void
        {
            this._debugger = k;
        }

        public function get debugger():String
        {
            return this._debugger;
        }

        public function set levels(k:String):void
        {
            if (k != null)
            {
                if (!StringUtils.isEmpty(k))
                {
                    this._levels = k;
                }
            }
        }

        public function get levels():String
        {
            return this._levels;
        }

        public function _Str_18288():Boolean
        {
            return !(this._levels == null);
        }

        public function outputingDebug():Boolean
        {
            return !(StringUtils.trim(this._levels).toUpperCase() == "NONE");
        }
    }
}
