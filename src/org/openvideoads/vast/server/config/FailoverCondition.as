package org.openvideoads.vast.server.config
{
    import org.openvideoads.base.Debuggable;

    public class FailoverCondition extends Debuggable 
    {
        protected var _Str_16802:Boolean = false;
        protected var _Str_11489:Array = null;

        public function FailoverCondition(k:Object=null)
        {
            this.initialise(k);
        }

        public function initialise(k:Object=null):void
        {
            if (k != null)
            {
                if (k.always != undefined)
                {
                    if ((k.always is String))
                    {
                        this.always = ((k.always.toUpperCase() == "TRUE") ? true : false);
                    }
                    else
                    {
                        this.always = k.always;
                    }
                }
                if (k.rules != undefined)
                {
                    if ((k.rules is Array))
                    {
                        this.rules = k.rules;
                    }
                }
            }
        }

        public function set always(k:Boolean):void
        {
            this._Str_16802 = k;
        }

        public function get always():Boolean
        {
            return this._Str_16802;
        }

        public function _Str_20289():Boolean
        {
            if (this._Str_11489 != null)
            {
                return this._Str_11489.length > 0;
            }
            return false;
        }

        public function set rules(k:Array):void
        {
            this._Str_11489 = k;
        }

        public function get rules():Array
        {
            return this._Str_11489;
        }

        public function shouldFailover(k:String):Boolean
        {
            var _local_2:int;
            if (this._Str_16802)
            {
                if (this._Str_20289())
                {
                    if (k != null)
                    {
                        _local_2 = 0;
                        while (_local_2 < this._Str_11489.length)
                        {
                            if (k.indexOf(this.rules[_local_2]) > -1)
                            {
                                return true;
                            }
                            _local_2++;
                        }
                    }
                }
                else
                {
                    return true;
                }
            }
            return false;
        }
    }
}
