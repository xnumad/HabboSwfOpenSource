package com.sulake.habbo.avatar.legs
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.figuredata.FigureData;

    public class LegsModel extends CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        public function LegsModel(k:HabboAvatarEditor)
        {
            super(k);
        }

        override protected function init():void
        {
            super.init();
            _Str_3130(FigureData.LG);
            _Str_3130(FigureData.SH);
            _Str_3130(FigureData.WA);
            _isInitialized = true;
            if (!_view)
            {
                _view = new LegsView(this);
                if (_view)
                {
                    _view.init();
                }
            }
        }
    }
}
