package com.sulake.habbo.avatar.torso
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.figuredata.FigureData;

    public class TorsoModel extends CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        public function TorsoModel(k:HabboAvatarEditor)
        {
            super(k);
        }

        override protected function init():void
        {
            super.init();
            _Str_3130(FigureData.CC);
            _Str_3130(FigureData.CH);
            _Str_3130(FigureData.CHEST_ACCESSORIES);
            _Str_3130(FigureData.CHEST_PRINTS);
            _isInitialized = true;
            if (!_view)
            {
                _view = new TorsoView(this);
                if (_view)
                {
                    _view.init();
                }
            }
        }
    }
}
