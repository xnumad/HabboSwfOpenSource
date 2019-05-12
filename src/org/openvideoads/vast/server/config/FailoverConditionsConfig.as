package org.openvideoads.vast.server.config
{
    import org.openvideoads.base.Debuggable;

    public class FailoverConditionsConfig extends Debuggable 
    {
        protected var _Str_9112:FailoverCondition = null;
        protected var _Str_6442:FailoverCondition = null;

        public function FailoverConditionsConfig(k:Object=null)
        {
            this.initialise(k);
        }

        public function initialise(k:Object):void
        {
            if (k.onVPAIDError != undefined)
            {
                this._Str_9112 = new FailoverCondition(k.onVPAIDError);
            }
            if (k.onStreamError != undefined)
            {
                this._Str_6442 = new FailoverCondition(k.onStreamError);
            }
        }

        public function hasFailoverConditionOnVPAIDError():Boolean
        {
            return !(this._Str_9112 == null);
        }

        public function set onVPAIDError(k:FailoverCondition):void
        {
            this._Str_9112 = k;
        }

        public function get onVPAIDError():FailoverCondition
        {
            return this._Str_9112;
        }

        public function _Str_26091():Boolean
        {
            if (this._Str_9112 != null)
            {
                return this._Str_9112.always;
            }
            return false;
        }

        public function hasFailoverConditionOnStreamError():Boolean
        {
            return !(this._Str_6442 == null);
        }

        public function set onStreamError(k:FailoverCondition):void
        {
            this._Str_6442 = k;
        }

        public function get onStreamError():FailoverCondition
        {
            return this._Str_6442;
        }

        public function _Str_26001():Boolean
        {
            if (this._Str_6442 != null)
            {
                return this._Str_6442.always;
            }
            return false;
        }

        public function _Str_25963():Boolean
        {
            if (this._Str_6442 != null)
            {
                return this._Str_6442._Str_20289();
            }
            return false;
        }
    }
}
