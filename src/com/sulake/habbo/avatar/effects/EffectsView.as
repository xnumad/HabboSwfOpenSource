package com.sulake.habbo.avatar.effects
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
    import com.sulake.core.window.IWindowContainer;

    public class EffectsView extends CategoryBaseView implements IAvatarEditorCategoryView 
    {
        public function EffectsView(k:IAvatarEditorCategoryModel)
        {
            super(k);
        }

        override public function init():void
        {
            if (!window)
            {
                window = (_Str_2307.controller.view.getCategoryContainer(AvatarEditorFigureCategory.EFFECTS) as IWindowContainer);
                window.visible = false;
            }
            if (((_Str_2307) && (_Str_2889 == "")))
            {
                _Str_2307.switchCategory(EffectsModel.EFFECTS);
            }
            _Str_2367 = true;
            this.updateGridView(_Str_2889);
        }

        override public function reset():void
        {
            this.updateGridView(_Str_2889);
            _Str_2307.selectPart(_Str_2889, -1);
        }

        public function switchCategory(k:String):void
        {
            if (window == null)
            {
                return;
            }
            if (window.disposed)
            {
                return;
            }
            k = ((k == "") ? _Str_2889 : k);
            _Str_2889 = k;
            if (!_Str_2367)
            {
                this.init();
            }
            this.updateGridView(_Str_2889);
        }

        public function _Str_8706(k:String, _arg_2:int, _arg_3:Boolean):void
        {
            AvatarEditorGridViewEffects(_Str_2307.controller.view.effectsGridView)._Str_24690(_arg_2, _arg_3);
        }

        public function _Str_17454(k:int):int
        {
            return AvatarEditorGridViewEffects(_Str_2307.controller.view.effectsGridView)._Str_17454(k);
        }

        override protected function updateGridView(k:String):void
        {
            _Str_2307.controller.view.effectsGridView.initFromList(_Str_2307, k);
        }
    }
}

