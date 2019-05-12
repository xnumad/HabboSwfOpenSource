package com.sulake.habbo.avatar.effects
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.IHabboAvatarEditorAvatarEffect;

    public class EffectsModel extends CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        public static const EFFECTS:String = "effects";

        private var _selectedIndex:Dictionary;
        private var _effectsParamView:EffectsParamView;

        public function EffectsModel(k:HabboAvatarEditor)
        {
            this._selectedIndex = new Dictionary();
            super(k);
        }

        override protected function init():void
        {
            super.init();
            _Str_2367 = true;
            if (!_Str_2271)
            {
                _Str_2271 = new EffectsView(this);
                this._effectsParamView = new EffectsParamView(this, controller.manager.windowManager, controller.manager.assets);
                if (_Str_2271)
                {
                    _Str_2271.init();
                }
            }
        }

        public function get effects():Array
        {
            if (controller.manager.inventory == null)
            {
                return [];
            }
            return controller.manager.inventory.getAvatarEffects();
        }

        override public function selectPart(k:String, _arg_2:int):void
        {
            var _local_4:*;
            var _local_5:IHabboAvatarEditorAvatarEffect;
            this._Str_20089(k, this._selectedIndex[k], false);
            var _local_3:int = controller.figureData.avatarEffectType;
            if (((_arg_2 == -1) && (!(_local_3 == -1))))
            {
                _arg_2 = EffectsView(_Str_2271)._Str_17454(_local_3);
                for each (_local_4 in this.effects)
                {
                    if (_local_4.type == _local_3)
                    {
                        _local_5 = IHabboAvatarEditorAvatarEffect(_local_4);
                        _local_5._Str_2365 = true;
                        break;
                    }
                }
            }
            else
            {
                if ((((_arg_2 == -1) && (_local_3 == -1)) || (_arg_2 == 0)))
                {
                    _arg_2 = 0;
                    controller.setAvatarEffectType(-1);
                    this._effectsParamView._Str_2491(null);
                }
                else
                {
                    _local_5 = IHabboAvatarEditorAvatarEffect(this.effects[(_arg_2 - 1)]);
                    _local_5._Str_2365 = true;
                    controller.setAvatarEffectType(_local_5.type);
                }
            }
            this._selectedIndex[k] = _arg_2;
            this._Str_20089(k, _arg_2, true);
            this._effectsParamView._Str_2491(_local_5);
        }

        private function _Str_20089(k:String, _arg_2:int, _arg_3:Boolean):void
        {
            EffectsView(_Str_2271)._Str_8706(k, _arg_2, _arg_3);
        }
    }
}
