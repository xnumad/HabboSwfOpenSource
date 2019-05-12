package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.config._Str_2741;

    public class _Str_3389 extends Debuggable implements _Str_2741 
    {
        protected var _Str_4686:_Str_2741 = null;
        protected var _Str_3351:Boolean = true;
        protected var _Str_8150:Boolean = false;

        public function _Str_3389(k:Object=null, _arg_2:_Str_2741=null)
        {
            if (k != null)
            {
                this.initialise(k, _arg_2);
            }
        }

        public function initialise(k:Object=null, _arg_2:_Str_2741=null, _arg_3:Boolean=false):void
        {
            if (_arg_2 != null)
            {
                this.setLoadedListener(_arg_2);
            }
        }

        public function setLoadedListener(k:_Str_2741):void
        {
            this._Str_4686 = k;
        }

        public function _Str_26116():void
        {
            this._Str_4686 = null;
        }

        public function _Str_17039():Boolean
        {
            return !(this._Str_4686 == null);
        }

        public function _Str_3654():void
        {
            this._Str_3351 = true;
            this._Str_8150 = true;
        }

        public function _Str_3144():void
        {
            this._Str_3351 = false;
            this._Str_8150 = false;
            this.onOVAConfigLoaded();
        }

        public function _Str_6073():Boolean
        {
            return this._Str_8150;
        }

        public function _Str_6229():Boolean
        {
            return this._Str_3351;
        }

        public function isOVAConfigLoading():Boolean
        {
            return this._Str_6229();
        }

        public function onOVAConfigLoaded():void
        {
            if (this.isOVAConfigLoading() == false)
            {
                if (this._Str_17039())
                {
                    this._Str_4686.onOVAConfigLoaded();
                }
            }
        }
    }
}
