package com.sulake.habbo.inventory.effects
{
    import com.sulake.habbo.inventory.common.IThumbListDataProvider;

    public class EffectListProxy implements IThumbListDataProvider 
    {
        private var _model:EffectsModel;
        private var _filter:int;

        public function EffectListProxy(k:EffectsModel, _arg_2:int)
        {
            this._model = k;
            this._filter = _arg_2;
        }

        public function dispose():void
        {
            this._model = null;
        }

        public function _Str_22161():Array
        {
            return this._model._Str_6532(this._filter);
        }
    }
}
