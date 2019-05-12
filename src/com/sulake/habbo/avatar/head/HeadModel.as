package com.sulake.habbo.avatar.head
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.figuredata.FigureData;

    public class HeadModel extends CategoryBaseModel implements IAvatarEditorCategoryModel 
    {
        public function HeadModel(k:HabboAvatarEditor)
        {
            super(k);
        }

        override protected function init():void
        {
            super.init();
            _Str_3130(FigureData.HR);
            _Str_3130(FigureData.HA);
            _Str_3130(FigureData.HE);
            _Str_3130(FigureData.EA);
            _Str_3130(FigureData.FA);
            _Str_2367 = true;
            if (!_Str_2271)
            {
                _Str_2271 = new HeadView(this);
                if (_Str_2271)
                {
                    _Str_2271.init();
                }
            }
        }
    }
}
