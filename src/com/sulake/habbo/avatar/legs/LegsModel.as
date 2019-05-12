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
            _Str_2367 = true;
            if (!_Str_2271)
            {
                _Str_2271 = new LegsView(this);
                if (_Str_2271)
                {
                    _Str_2271.init();
                }
            }
        }
    }
}
